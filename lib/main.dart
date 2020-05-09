import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:learnprog/Categories.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
void main() => runApp(
  //  MyApp()
  DevicePreview(
   builder: (context) => MyApp(),
  ),

);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      title: 'Learn Proramming',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:splash(),
    );
  }
}

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
    ]);
    // TODO: implement initState
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Categories()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff01464D).withOpacity(0.45),
        body: SingleChildScrollView(

          child: Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/3.25),
            child: Column(


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
Center(child: Image.asset("assets/images/logo.png",width:MediaQuery.of(context).size.height/2.25,),),
SizedBox(height: 20,),
              Center(
                child: SizedBox(

                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 40),
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Coding Books",
                      "by flash solutions"

                    ],
                    textStyle: TextStyle(
                        fontSize: 25.0,
                        fontFamily: "Horizon",
                      color: Colors.white70
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
            ),
              )


            ],),
          ),
        ));
  }
}
