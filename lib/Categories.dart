import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'values.dart';
import 'BookList.dart';
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  final List<myvalues> values = [

    myvalues("assets/images/ang.png","Angular Books"),
    myvalues("assets/images/cplus.png","C++ Books"),
    myvalues("assets/images/csharp.png","C# Books"),
    myvalues("assets/images/js.png","Javascript Books"),
    myvalues("assets/images/html.png","HTML Books"),
    myvalues("assets/images/matlab.png","Matlab Books"),
    myvalues("assets/images/mongodb.png","MongoDb Books"),
    myvalues("assets/images/node.png","NodeJs Books"),
    myvalues("assets/images/sql.png","SQL Books")

  ];


  @override
  Widget build(BuildContext context) {
    var x=MediaQuery.of(context).size.height;
    return Scaffold(

backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
Positioned(

    height: x,
   // child: Image.asset("assets/images/bkg.jpg")
child: Image.network("https://www.idaptweb.com/wp-content/uploads/2019/10/computer-keyboard-connection-contemporary-1714208.jpg"),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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


      )
    );
  }

  Widget _buildCategoryItems(BuildContext context, int index) {
   // Category category = categories[index];
myvalues data=values[index];

    
    return Card(

      color: Colors.lightBlueAccent.withOpacity(0.1),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20.0),
        side: new BorderSide(color: Colors.white, width: 1.0),
      ),

      child: InkWell(
        onTap: (){

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
            data.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold
          ,color: Colors.white),
            textAlign: TextAlign.center,
           ),
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