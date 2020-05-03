import 'dart:io';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_extend/share_extend.dart';
import 'ViewPdf.dart';
import 'CommonMethods.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
class Details extends StatefulWidget {

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

var dir;

Color progressColor=Colors.blueAccent;

  var progressString = "";
var percent=0.0;


String myDownloadFile;
Directory _downloadsDirectory;




Future<void> initDownloadsDirectoryState() async {
  Directory downloadsDirectory;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  } on PlatformException {
    print('Could not get the downloads directory');
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  if (!mounted) return;

  setState(() {
    _downloadsDirectory = downloadsDirectory;
  });
}


  Future<void> downloadFile() async {
  if(progressColor==Colors.red)
    {
      setState(() {
        progressColor=Colors.blueAccent;
        percent=0.0;
      });
    }

    Dio dio = Dio();

print(_downloadsDirectory);
    try {
    //  dir = await getApplicationDocumentsDirectory();
//      new Directory(dir.path+'/'+'dir').create(recursive: true)
//// The created directory is returned as a Future.
//          .then((Directory directory) {
//        print('Path of New Dir: '+directory.path);
//      });


String myfile=CM.title+".pdf";
      await dio.download(CM.pdf, "${_downloadsDirectory.path}/${myfile}",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";

percent=rec/total;
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
if(percent==1.0||percent==1)
  {
    progressString = "Finished";
  }
    else
      {
        progressString = "Failed";
        progressColor=Colors.red;
      }
    });
    print("Download completed");
 //   OpenFile.open('$dir/myfile1.pdf');

//    List<FileSystemEntity> _files;
//    _files = dir.listSync(recursive: true, followLinks: false);
//    print(_files);
  }

//  Future<void> downloadFile2() async {
//
//    final taskId = await FlutterDownloader.enqueue(
//      url: 'https://firebasestorage.googleapis.com/v0/b/basic-84916.appspot.com/o/Labmongodb.pdf?alt=media&token=9525c5f6-f835-4343-a3eb-7319e692f643',
//      savedDir: getApplicationDocumentsDirectory().toString(),
//      showNotification: true, // show download progress in status bar (for Android)
//      clickToOpenDownloadedFile: true, // click on notification to open downloaded file (for Android)
//    );
//
//  }
  void share() async {
    initDownloadsDirectoryState();
    String fileName=CM.title+".pdf";
    File testFile = new File("${_downloadsDirectory.path}/${fileName}");
    if (await testFile.exists()) {
//      await testFile.create(recursive: true);
//      testFile.writeAsStringSync("test for share documents file");

      ShareExtend.share(testFile.path, "file");
    }
    else{
      CM.showToast(context, "First Download before Sharing");
    }

  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDownloadsDirectoryState();
  }


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
appBar: AppBar(title: Text(CM.name,style:  GoogleFonts.hindMadurai(

),),
  leading: new IconButton(
      icon: new FaIcon(FontAwesomeIcons.thList,size: 25,),
      onPressed: () => _scaffoldKey.currentState.openDrawer())
    ,centerTitle: true,backgroundColor: Color(0x1893C5D8),),
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
        ),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

backgroundColor: Color(0xff93C5D8).withOpacity(0.1),
      body: SingleChildScrollView(
        child: Stack(

          children: <Widget>[

        ClipPath(
        clipper: ArcClipper(),
child: Image.asset(
"assets/images/bkg.jpg",
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
//            Positioned(
//              top: 12,
//              left: 5,
//              child: IconButton(
//                icon: Icon(Icons.list,color: Colors.white,size: 44,),
//                tooltip: 'Increase volume by 10',
//                onPressed: () {
//                  //Scaffold.of(context).openDrawer();
//                },
//              ),
//            ),
            Positioned(
              top: MediaQuery.of(context).size.height/2.2,
              left: MediaQuery.of(context).size.width/1.4,
              child: Container(
                //  margin: EdgeInsets.only(left: 100),
                child: new CircularPercentIndicator(

                  radius: 90.0,
                  lineWidth: 4.0,
                  percent: percent,

                  center: new Text(progressString,style: TextStyle(color: Colors.white),),
                  progressColor:progressColor,
                ),
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

           // borderRadius: BorderRadius.circular(20.0),
            elevation: 20.0,
            child: Image.network(

           CM.imgpath,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width/2.3,//152
            height: 220,
            ),
            ),
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(

mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[



                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    
                    child: AutoSizeText(
                    CM.title,
                    style:  GoogleFonts.bitter(
                    textStyle: TextStyle(color: Colors.white, ),

                    fontSize: 20),

                    maxLines: 4,


              ),
                  ),

                  SizedBox(height: 15,),
                  Text("Size: "+CM.size,
                  style:  GoogleFonts.hind(
                  textStyle: TextStyle(color: Colors.yellow, ),

        fontSize: 15),),
                  Text("Pages "+CM.pages,
                    style:  GoogleFonts.hind(
                        textStyle: TextStyle(color: Colors.deepOrangeAccent, ),

                        fontSize: 15),

                  ),



                    


                ],),


              ),





            ],
          ),

        ),






        Container(

          margin: EdgeInsets.only(top: 15,right: 55),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

//              FloatingActionButton(
//
//                child: Text("Open",
//              style: TextStyle(color: Colors.white),
//              ),
//backgroundColor: Colors.blueAccent,
//
//
//              ),
//SizedBox(width: 15,),
            IconButton(

              icon: FaIcon(FontAwesomeIcons.print,color: Colors.white,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfView()),
              );

            },),



            IconButton(
              onPressed:()async{
                final PermissionHandler _permissionHandler = PermissionHandler();
                var result = await _permissionHandler.requestPermissions([PermissionGroup.storage]);

    if (result[PermissionGroup.storage] == PermissionStatus.granted) {
      downloadFile();
    }
                },



              icon: FaIcon(FontAwesomeIcons.download,color: Colors.white),),
            IconButton(
              onPressed: share,

              icon: FaIcon(FontAwesomeIcons.shareAlt,color: Colors.white),),


          ],),),

Stack(children: <Widget>[

//  Image.network(
//
//    "https://www.idaptweb.com/wp-content/uploads/2019/10/computer-keyboard-connection-contemporary-1714208.jpg",
//    //height: 230,
//    width: screenWidth,fit: BoxFit.cover,
//  ),


  Container(


    height: MediaQuery.of(context).size.height/2.8,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Color(0xffffffff).withOpacity(0.15),
  BlendMode.dstIn),
        image: AssetImage(CM.transparentImg),
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



  //Text("Introduction",style: TextStyle(fontSize: 30,color:Colors.yellow,fontWeight: FontWeight.bold),),
      Text("Introduction",style:  GoogleFonts.monoton(
    textStyle: TextStyle(color: Colors.yellow, ),

    fontSize:25),),

  AutoSizeText(
   CM.intro,
      maxLines: 7,
    style:  GoogleFonts.patuaOne(
        textStyle: TextStyle(color: Colors.white70, ),

        fontSize: 20),
  ),




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