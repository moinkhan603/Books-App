import 'package:flutter/material.dart';
import 'package:learnprog/Categories.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    // TODO: implement initState
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Categories()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              GestureDetector(
                onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => gridPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:28.0),
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[


                    SizedBox(
                    width: 250.0,
                    child: TypewriterAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          "Discipline is the best tool",
                          "Design first, then code",
                          "Do not patch bugs out, rewrite them",
                          "Do not test bugs out, design them out",
                        ],
                        textStyle: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Agne",
                          color: Colors.white
                        ),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
                  )


                  ],),
                )
              )
            ],
          ),
        ));
  }
}
