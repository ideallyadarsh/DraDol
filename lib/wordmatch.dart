import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

import 'home.dart';
class Wordgame extends StatefulWidget{
  @override
  _WordgameState createState() => _WordgameState();
}

class _WordgameState extends State<Wordgame> {
  bool game=false;
  final Map<String,bool> score = {};
      Map word={
      '🍕':'Pizza',
      '🍔':'Burger',
      '🍿':'Popcorn',
      '🍜':'Noodles',
      '🍨':'Ice Cream',
      '🥪':'Sandwich',
      '🎂':'Cake',
      '🍫':'Chocolate',
      '🍭':'Lollipop',
      '🍇':'Gapes',
    };
      Map word2={
        '🍊':'Orange',
        '🍍':'Pineapple',
        '🍎':'Apple',
        '🍌':'Banana',
        '🍉':'WaterMelon',
        '🥥':'Coconut',
        '🥝':'Kiwi',
        '🍐':'Guava',
        '🍋':'Papaya',
        '🍓':'Strawberry',
      };
    String level ='I';
    int seed=0;
    AudioCache _audioCache =AudioCache();

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    height=height-200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title:Row(
            mainAxisSize: MainAxisSize.min, children: [
          IconButton(icon: Icon(Icons.home),onPressed: ()=>Navigator.pop(context),),
          SizedBox(width: 10,),
          Text("Word Match $level",style: TextStyle(color: Colors.white),),]),
         ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10,),
          Text("Match The Item With the Color",style: TextStyle(fontSize: 20,color: Colors.black),),
          SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Score: ", style: TextStyle(fontFamily: "Pacifico",fontSize: 20, color: Colors.red),),
              Text("${score.length}", style: TextStyle(fontFamily: "Lobster",fontSize: 35, color: Colors.green),),
              Text(" /10", style: TextStyle(fontSize: 20, color: Colors.black),),
            ],),SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
             children: word.keys.map((words){
               return Draggable<String>(
                 data:words,
                 child:display(context, score[words]==true?'✔':words),
                feedback:display(context, words),
                 childWhenDragging: display(context,'🤔' ),
               );
             }).toList()..shuffle(Random(seed+3)),
            ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
                children:
                word.keys.map((words) => buildDragTarget(words)).toList()..shuffle(Random(seed)),
              ),
           ],
          ),
         ],
        ),
      ),

         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         floatingActionButton:FloatingActionButton(
          tooltip: "Refresh",
          child: Icon(Icons.refresh),
          onPressed: (){setState(() {
            score.clear();
            seed++;
          });},
        ),
    );
  }

  Widget buildDragTarget(words){
    return DragTarget<String>(
      builder: (BuildContext context,List<String> incoming,List rejected){
        double height =MediaQuery.of(context).size.height;
        height=height-200;
        if(score[words]==true){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Colors.transparent,
              child: Text("Correct",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
              alignment: Alignment.centerRight,
              height: height/12,
              width:150,
            ),
          );
        }
        else{
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(alignment: Alignment.centerRight,child:Text(word[words],style: TextStyle(fontSize: 17),),height: height/12, width:150,),
          );
        }
      },
      onWillAccept: (data)=>data==words,
      onAccept: (data){
        setState(() {
          score[words]=true;
          if(score.length==10){
            dialogue(context);
          }
        });
        _audioCache.play("successful.mp3");
      },
      onLeave: (data){},
    );
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
                FlatButton(color: Colors.pink,child: Text("Next Level"),
                    onPressed: (){
                  if(game==false){
                    setState(() {
                      word=word2;
                      level='II';
                      game=true;
                      score.clear();
                    });
                  }
                  else{Navigator.pop(context);
                  Navigator.pop(context);}
                Navigator.pop(context);
                }),
              ],
            ),

        ],
      );
    }
    );
  }
}

Widget display(BuildContext context,emoji){
  double height =MediaQuery.of(context).size.height;
  height=height-200;
  return Material(
    child:Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment.center,
        height: height/12,
        child: Text(emoji,style: TextStyle(fontFamily: 'Pacifico',color: Colors.black, fontSize: 20),),
      ),
    ),
  );
}


