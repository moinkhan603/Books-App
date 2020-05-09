import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'CommonMethods.dart';
import 'package:flutter/material.dart';
import 'package:learnprog/Detail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import'package:cloud_firestore/cloud_firestore.dart';
class BookList extends StatefulWidget {

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {


  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>books;
  final CollectionReference collectionReference=
  Firestore.instance.collection(CM.cover);
  List filterlist;



  void myfilter(value)
  {
    setState(() {
      filterlist=books.where((mydata)=>mydata['name'].toLowerCase().contains(value.toLowerCase())).toList();

    });
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription=collectionReference.snapshots()
        .listen((datasnapshot){


      setState(() {
        books=filterlist=datasnapshot.documents;
      });


    });


  }



  @override
  void dispose() {

  subscription?.cancel();
  // TODO: implement dispose
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
double myheight=240;
double myTitleFont=20;
double myPagesFont=18;
double myButtonSize=15;
double padding=20;
  @override
  Widget build(BuildContext context) {
    var hgt=MediaQuery.of(context).size.height;

    if(hgt>1000)
      {
        setState(() {
          myheight=450;
          myTitleFont=50;
          myPagesFont=40;
          myButtonSize=40;
          padding=50;
        });
      }
    if(hgt<1000&&hgt>900)
    {

      setState(() {
        myheight=350;
        myTitleFont=35;
        myPagesFont=25;
      });
    }

    print(hgt);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("JavaScript Books"),

        leading: new IconButton(
            icon: new FaIcon(FontAwesomeIcons.thList,size: 28,),
            onPressed: () => _scaffoldKey.currentState.openDrawer())
          ,centerTitle: true,backgroundColor: Color(0x1893C5D8),
      elevation: 10,),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text('Drawer Header',textAlign: TextAlign.center,),
              decoration: BoxDecoration(
                color: Color(0xff01464D).withOpacity(0.6),
              ),
            ),
            ListTile(
              leading:   new FaIcon(FontAwesomeIcons.shareAlt,color:Color(0xff006B7F)),
              title: Text('Share'),
              subtitle: Text("Share this app"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading:   new FaIcon(FontAwesomeIcons.thumbsUp,color:Color(0xff006B7F)),
              subtitle: Text("Rate us now",),
              title: Text('Rate us',style: TextStyle(color: Colors.black),),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )
      ,
extendBodyBehindAppBar: true,
body:  Stack(children: <Widget>[
  Positioned(

      height: MediaQuery.of(context).size.height,
      //child: Image.asset("assets/images/bkg.jpg")
child:Image.asset("assets/images/bkg.jpg"),

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

filterlist!=null?
    Container(
      margin: EdgeInsets.only(top: 150),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(

physics: BouncingScrollPhysics(),

itemCount: filterlist.length,

      itemBuilder: (BuildContext context, int index) {
String imgpath=filterlist[index].data['img'];
String title=filterlist[index].data['name'];
String pages=filterlist[index].data['pages'];
String size=filterlist[index].data['size'];
String pdf=filterlist[index].data['pdf'];
String intro=filterlist[index].data['intro'];
print(pages);
print(filterlist.length);
        return mycard(imgpath,title,pages,size,pdf,intro);



      }


      ),
    ):Center(child: CircularProgressIndicator())
,
  Card(
    margin: EdgeInsets.only(left: 30, right:30, top:110),
    elevation: 11,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
    child: TextField(
      onChanged: (value){
        print(value);
        myfilter(value);
      },
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
//  Positioned(
//    top: 12,
//    left: 5,
//    child: IconButton(
//      icon: Icon(Icons.list,color: Colors.white,size: 44,),
//      tooltip: 'Increase volume by 10',
//      onPressed: () {
//
//      },
//    ),
//  ),  //Stack(children: <Widget>[

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

  Container mycard(imgpath,title,pages,size,pdf,intro) {


    return Container(
    padding: EdgeInsets.only(left: padding, right: padding,top: 5,bottom: 5),
    margin: EdgeInsets.only(bottom: 20.0),
    height: myheight,
    child: Row(
      children: <Widget>[
        Expanded(child: Container(
          decoration: BoxDecoration(
              image:



              DecorationImage(

                  image:
              NetworkImage(imgpath), fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(color: Colors.black87.withOpacity(0.1),offset: Offset(5.0,5.0), blurRadius: 20.0)
              ]
          ),
        )),
        Expanded(child: Container(
         
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Text("javascript dfdsss sssdsds notres for profs",style: TextStyle(
//                  fontSize: 15.0,
//                  color: Colors.white,
//                  fontStyle: FontStyle.italic,
//                  fontWeight: FontWeight.bold
//              ),),

            AutoSizeText(
             title
                  ,maxLines: 3, style:  GoogleFonts.ubuntu(
          textStyle: TextStyle(color: Colors.white, ),

            fontSize: myTitleFont),

            ),





              SizedBox(height: 6.0,),
              Text("Pages: "+pages, style:  GoogleFonts.hindMadurai(
                  textStyle: TextStyle(color: Colors.lightGreenAccent, ),

                  fontSize: myPagesFont), ),

RaisedButton(

  elevation: 10,
child: Text("Details",style: TextStyle(fontSize: myButtonSize),),
  onPressed:(){
    CM.imgpath=imgpath;
    CM.title=title;
    CM.pages=pages;
    CM.size=size;
    CM.pdf =pdf;
    CM.intro=intro;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details(

      )),
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