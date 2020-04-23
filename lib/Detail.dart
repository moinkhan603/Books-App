import 'package:flutter/material.dart';
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
backgroundColor: Color(0xff93C5D8).withOpacity(0.2),
      body: SingleChildScrollView(
        child: Stack(

          children: <Widget>[

        ClipPath(
        clipper: ArcClipper(),
child: Image.network(

    "https://www.idaptweb.com/wp-content/uploads/2019/10/computer-keyboard-connection-contemporary-1714208.jpg",
height: 230,
  width: screenWidth,fit: BoxFit.cover,
),



//        child: Image.asset(
//          "assets/images/bkg.jpg",
//          width: screenWidth,
//          height: 230.0,
//          fit: BoxFit.cover,
//        ),
    ),
            Positioned(
              top: 12,
              left: 5,
              child: IconButton(
                icon: Icon(Icons.list,color: Colors.white,size: 44,),
                tooltip: 'Increase volume by 10',
                onPressed: () {

                },
              ),
            ),
    Column(
      children: <Widget>[
        Container(
margin: EdgeInsets.only(top: 156,left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Material(

            borderRadius: BorderRadius.circular(8.0),
            elevation: 20.0,
            child: Image.asset(
            "assets/images/jss.png",
            fit: BoxFit.cover,
            width: 152,
            height: 200,
            ),
            ),
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(


                  children: <Widget>[

                  Text("JavaScript",style: TextStyle(color: Colors.white,fontSize: 30),),
                  Text("Size",style: TextStyle(color: Color(0xffF5BD1F),fontSize: 20),),
                  Text("Pages",style: TextStyle(color: Colors.redAccent,fontSize: 20),),

                ],),
              )
            ],
          ),

        ),
        Container(

          margin: EdgeInsets.only(top: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
            IconButton(icon: Icon(Icons.print,size: 35,color: Colors.white,),),
            IconButton(icon: Icon(Icons.file_download,size: 35,color: Colors.white),),
            IconButton(icon: Icon(Icons.share,size: 35,color: Colors.white),),


          ],),),

Stack(children: <Widget>[

//  Image.network(
//
//    "https://www.idaptweb.com/wp-content/uploads/2019/10/computer-keyboard-connection-contemporary-1714208.jpg",
//    //height: 230,
//    width: screenWidth,fit: BoxFit.cover,
//  ),


  Container(


    height: MediaQuery.of(context).size.height/2.55,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Color(0xffffffff).withOpacity(0.15),
  BlendMode.dstIn),
        image: AssetImage("assets/images/js.png"),
        fit: BoxFit.fill
      ),
      border: Border.all(width:10.00, color: Color(0xff93C5D8).withOpacity(0.0),),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00,3.00),
          color: Colors.black87,
          blurRadius: 0,
        ),
      ],
    ),


   // height: 251,

    //width: MediaQuery.of(context).size.width,

    child: Column(children: <Widget>[



  Text("JAVA SCRIPT",style: TextStyle(fontSize: 30,color:Colors.yellow,fontWeight: FontWeight.bold),),
  Text("jsdhusdsh "
      "sdsdsdsdddddadasndisdisi ius dms isd a mand "
      "i sdisu mnas dihsmadn iadm sauidhma "
      "iyudm 9w   oia d s adhiadn id knasid mandij ",
    style: TextStyle(fontSize: 20,color: Colors.white),),




    ],),



  ),




]
)
      ],
    ),



          ],
        ),
      ),



    );
  }
}


class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}