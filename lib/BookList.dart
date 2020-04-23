import 'package:flutter/material.dart';
import 'package:learnprog/Detail.dart';
class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Colors.white,


body:  Stack(children: <Widget>[
  Positioned(

      height: MediaQuery.of(context).size.height,
      //child: Image.asset("assets/images/bkg.jpg")
child: Image.network("https://www.idaptweb.com/wp-content/uploads/2019/10/computer-keyboard-connection-contemporary-1714208.jpg"),

  ),
  ClipPath(
    clipper: CustomClipPath(),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.white.withOpacity(0.5)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      height: 300,
    ),


  ),



//Positioned(
//
//
//
//
//
//          child: Center(child: Image.asset("assets/images/ang.png",fit: BoxFit.cover,)
//
//          )
//
//
//
//      ),


    SingleChildScrollView(
physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top:200),

      child: Column(

        children: <Widget>[
          mycard(),
          mycard(),
          mycard(),
          mycard(),
        ],
      ),
    )
,
  Card(
    margin: EdgeInsets.only(left: 30, right:30, top:110),
    elevation: 11,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
    child: TextField(
      decoration: InputDecoration(
//          prefixIcon: Icon(Icons.person, color: Colors.black26,),
          suffixIcon: Icon(Icons.search, color: Colors.black,),
          hintText: "Search Books",
          hintStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(

            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
      ),
    ),
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
  ),  //Stack(children: <Widget>[

  //

  //      Positioned(

  //

  //          height: MediaQuery.of(context).size.height,

  //          child: Image.asset("assets/images/ang.png")

  //

  //      ),

  //

  //

  //

  //    ],),


],
),

    );
  }

  Container mycard() {
    return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 5,bottom: 5),
    margin: EdgeInsets.only(bottom: 20.0),
    height: 240,
    child: Row(
      children: <Widget>[
        Expanded(child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/jss.png"), fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(color: Colors.black87.withOpacity(0.1),offset: Offset(5.0,5.0), blurRadius: 20.0)
              ]
          ),
        )),
        Expanded(child: Container(
         
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Title",style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10.0,),
              Text("Category", style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              )),
              SizedBox(height: 10.0,),
              Text("Ratings", style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              )),
RaisedButton(
  elevation: 10,
child: Text("Details"),
  onPressed:(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details()),
    );
  },

  color: Color(0xff006B7F),
  textColor: Colors.white,)

            ],
          ),
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              color: Colors.black87.withOpacity(0.5),
//              boxShadow: [
//                BoxShadow(color: Colors.grey,offset: Offset(5.0,5.0), blurRadius: 10.0)
//              ]
          ),
        ),)
      ],
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