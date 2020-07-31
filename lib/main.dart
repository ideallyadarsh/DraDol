import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 4), () => Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Home()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: Colors.transparent,
               child: Lottie.asset('assets/splash.json'),
               ),
              Text("DraDol",style: TextStyle(fontSize: 35,color: Colors.tealAccent,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),),
              Text("Drag Drop Learn",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Lobster"))
            ],
          ),
        ),
    );
  }
}
