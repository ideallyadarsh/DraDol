import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'home.dart';

class ColorGame extends StatefulWidget {
  @override
  _ColorGameState createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  final Map<String,bool> score = {};
  final Map choices = {
    'Green':Colors.green,
    'Red':Colors.red,
    'Orange':Colors.orange,
    'Purple':Colors.purple,
    'Yellow':Colors.yellow,
    'Brown':Colors.brown,
    'Pink':Colors.pinkAccent,
    'Blue':Colors.blue,
    'Black':Colors.black,
    'White':Colors.white,
  };
  int seed=0;
  AudioCache _audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    height=height-200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title:Row(
            mainAxisSize: MainAxisSize.min, children: [
          IconButton(icon: Icon(Icons.home),onPressed: ()=>Navigator.pop(context),),
          SizedBox(width: 10,),
          Text("Color Match ",style: TextStyle(color: Colors.white),),]),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("Match The Word With the Color",style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Score: ", style: TextStyle(fontFamily: "Pacifico",fontSize: 20, color: Colors.red),),
                Text("${score.length}", style: TextStyle(fontFamily: "Lobster",fontSize: 35, color: Colors.green),),
                Text(" /10", style: TextStyle(fontSize: 20, color: Colors.black),),
              ],),SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                  choices.keys.map((emoji){
                    print(emoji);
                    return Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: score[emoji]==true?'✔':emoji),
                      feedback: Emoji(emoji: emoji,),
                      childWhenDragging: Emoji(emoji:'🤔'),
                    );
                  }).toList()..shuffle(Random(seed+3)),
                ),SizedBox(width: 15,),
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.end,
                  children: choices.keys.map((emoji) => buildDragTarget(emoji)).toList()..shuffle(Random(seed)),
                ),
              ],
            ),
          ],
        ),
      ) ,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){setState(() {
          score.clear();
          seed++;
        });},
      ),
    );
  }
  Widget buildDragTarget(emoji){
    return DragTarget<String>(
      builder: (BuildContext context,List<String> incoming,List rejected){
        double height =MediaQuery.of(context).size.height;
        height=height-200;
        if(score[emoji]==true){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Colors.transparent,
              child: Text("Correct",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              height: height/12,
              width:150,
            ),
          );
        }
        else {
           return Padding(
             padding: const EdgeInsets.all(4.0),
             child: Container(
               color: choices[emoji],height: height/12, width:140,),
           );
        }
      },
      onWillAccept: (data)=>data==emoji,
      onAccept: (data){
        setState(() {
          score[emoji]=true;
          if(score.length==10){
            dialogue(context);
          }
        });
        _audioCache.play("successful.mp3");
      },
      onLeave: (data){},
    );
  }
}
class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}):super(key:key);
  final String emoji;
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    height=height-200;
    return Material(
      color: Colors.transparent,
      child:Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          alignment: Alignment.center,
          height:height/12,
          child: Text(emoji,style: TextStyle(color: Colors.black,fontSize: 20),),
        ),
      ),
    );
  }
}
dialogue(BuildContext context){
  return showDialog(
      context: context,builder: (BuildContext context){
    return AlertDialog(
      title: Text("Score=10/10",textAlign: TextAlign.center,),
      actionsPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      elevation: 2,
      actions: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Image.asset("assets/success.gif"),
              FlatButton(color: Colors.pink,child: Text("Next ColorGame"),
                  onPressed: (){Navigator.pop(context);
                  Navigator.pop(context);})
            ],
          ),
      ],
    );
  }
  );
}