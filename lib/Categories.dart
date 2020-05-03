import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'values.dart';
import 'CommonMethods.dart';
import 'BookList.dart';
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  StreamSubscription<ConnectivityResult>subscription;
Connectivity connectivity;
bool isConnected;
  List<String>names=[
    "angular",
    "cplus",
    "csharp",
    "javascript",
    "html",
    "matlab",
    "mongodb",
    "nodejs",
    "sql",
    "python",
    "java"
  ];

  final List<myvalues> values = [

    myvalues("assets/images/ang.png","Angular Books"),
    myvalues("assets/images/cplus.png","C++ Books"),
    myvalues("assets/images/csharp.png","C# Books"),
    myvalues("assets/images/js.png","Javascript Books"),
    myvalues("assets/images/html.png","HTML Books"),
    myvalues("assets/images/matlab.png","Matlab Books"),
    myvalues("assets/images/mongodb.png","MongoDb Books"),
    myvalues("assets/images/node.png","NodeJs Books"),
    myvalues("assets/images/sql.png","SQL Books"),
    myvalues("assets/images/python.png","Python Books"),
    myvalues("assets/images/java.png","Java Books")

  ];

//Future<bool> CheckConnectivity()async{
//  var connectivityResult = await (Connectivity().checkConnectivity());
//  if (connectivityResult == ConnectivityResult.mobile) {
//    // I am connected to a mobile network.
//    return true;
//  } else if (connectivityResult == ConnectivityResult.wifi) {
//    // I am connected to a wifi network.
//
//      return true;
//
//
//  }
//  else{
//    return false;
//  }
//
//}
@override
  void initState() {
    // TODO: implement initState
    super.initState();

connectivity=new Connectivity();
subscription=connectivity.onConnectivityChanged.listen((ConnectivityResult Result){
  if(Result==ConnectivityResult.wifi|| Result==ConnectivityResult.mobile)
    {
setState(() {
  isConnected=true;
});
    }

  else{

    setState(() {
      isConnected=false;
    });

  }


});
}


  @override
  void dispose() {
    // TODO: implement dispose
subscription?.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    var x=MediaQuery.of(context).size.height;
    return Scaffold(

backgroundColor: Colors.white,
      body:

//CheckConnectivity()==true?



isConnected==true?
      Stack(children: <Widget>[
        Positioned(

          height: x,
          // child: Image.asset("assets/images/bkg.jpg")


          child: Image.asset("assets/images/bkg.jpg"),
        ),
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent.withOpacity(0.1),
                      Colors.white.withOpacity(0.5)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
            height: 300,
          ),


        ),

        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: SafeArea(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

//                    SizedBox(
//                    width: 250.0,
//    child: ColorizeAnimatedTextKit(
//    onTap: () {
//    print("Tap Event");
//    },
//    text: [
//    "Larry Page",
//    "Bill Gates",
//    "Steve Jobs",
//    ],
//    textStyle: TextStyle(
//    fontSize: 50.0,
//    fontFamily: "Horizon"
//    ),
//    colors: [
//    Colors.purple,
//    Colors.blue,
//    Colors.yellow,
//    Colors.red,
//      Colors.white
//    ],
//    textAlign: TextAlign.start,
//    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
//    ),
                      //  )
                    ],),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(25.0),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 14.0,
                      mainAxisSpacing: 12.0
                  ),
                  delegate: SliverChildBuilderDelegate(
                    _buildCategoryItems,
                    childCount: values.length,

                  )

              ),
            ),
          ],
        )

      ],


      ):

Container(
  color: Colors.black87,
  child: Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset("assets/images/alert.png",height: 120,),
      Text("No Internet Available"
,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),

),

    ],
  )),)

    );
  }

  Widget _buildCategoryItems(BuildContext context, int index) {
   // Category category = categories[index];
myvalues data=values[index];

String bookName= names[index];
    return Card(

      color: Colors.lightBlueAccent.withOpacity(0.1),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20.0),
        side: new BorderSide(color: Colors.white, width: 1.0),
      ),

      child: InkWell(
        onTap: (){
CM.name=data.title;
CM.transparentImg=data.imgpath;
CM.cover=bookName;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookList()),
          );

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//          if(category.icon != null)
//            Icon(category.icon),
//          if(category.icon != null)
//            SizedBox(height: 5.0),
            Image.asset(
              data.imgpath,
              //height: 500,
              fit: BoxFit.cover,
              height: 80,


            ),
          Text(
            data.title,style:   GoogleFonts.hindMadurai(
          textStyle: TextStyle(color: Colors.white, ),

          fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }


}

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}