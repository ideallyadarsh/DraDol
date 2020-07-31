import 'package:flutter/material.dart';
import 'package:DraDol/home.dart';
import 'package:audioplayers/audio_cache.dart';
class greaterless extends StatefulWidget {
  @override
  _greaterlessState createState() => _greaterlessState();
}

class _greaterlessState extends State<greaterless> {
  int seed = 2;
  AudioCache _audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(icon: Icon(Icons.home,size: 30,), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),),
              SizedBox(width: 10,),
              Text("Greater-Less", style: TextStyle(fontFamily: "Lobster",color: Colors.white),),
            ]),
          ),
      body: Column(children: [
        Row(children: [
          Column(children: [],),
        ],),
      ],),

    );
  }
}
