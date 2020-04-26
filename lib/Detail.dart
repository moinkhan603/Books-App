import 'dart:io';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ViewPdf.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
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

  final imgUrl = "https://firebasestorage.googleapis.com/v0/b/basic-84916.appspot.com/o/Labmongodb.pdf?alt=media&token=9525c5f6-f835-4343-a3eb-7319e692f643";
  bool downloading = false;
  var progressString = "";
var percent=0.0;



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
    Dio dio = Dio();

print(_downloadsDirectory);
    try {
      dir = await getApplicationDocumentsDirectory();
//      new Directory(dir.path+'/'+'dir').create(recursive: true)
//// The created directory is returned as a Future.
//          .then((Directory directory) {
//        print('Path of New Dir: '+directory.path);
//      });

print(dir.path);
      await dio.download(imgUrl, "${_downloadsDirectory.path}/myfile1.pdf",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";

percent=rec/total;
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Finished";
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
appBar: AppBar(title: Text("JavaScript Books"),
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

                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Color(0xff006B7F).withOpacity(0.8),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),

backgroundColor: Color(0xff93C5D8).withOpacity(0.1),
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
              top: MediaQuery.of(context).size.height/2.32,
              left: MediaQuery.of(context).size.width/1.4,
              child: Container(
                //  margin: EdgeInsets.only(left: 100),
                child: new CircularPercentIndicator(

                  radius: 80.0,
                  lineWidth: 4.0,
                  percent: percent,

                  center: new Text(progressString,style: TextStyle(color: Colors.white),),
                  progressColor: Colors.blueAccent,
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
            child: Image.asset(

            "assets/images/jss.png",
            fit: BoxFit.fill,
            width: 152,
            height: 220,
            ),
            ),
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(


                  children: <Widget>[

                  Text("JavaScript",style: TextStyle(color: Colors.white,fontSize: 30),),
                  Text("Size 20 MB",style: TextStyle(color: Color(0xffF5BD1F),fontSize: 20),),
                  Text("Pages 120",style: TextStyle(color: Colors.blue,fontSize: 20),),



                    


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
            IconButton(icon: FaIcon(FontAwesomeIcons.shareAlt,color: Colors.white),),


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