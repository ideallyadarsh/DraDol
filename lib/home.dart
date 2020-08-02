import 'package:flutter/material.dart';
import 'animations/pageAnimation.dart';
import 'maths/Numbers.dart';
import 'colors.dart';
import 'colmatch.dart';
import 'memoryGame/memorygame.dart';
import 'symbols.dart';
import 'wordmatch.dart';
import 'package:lottie/lottie.dart';
import './Poem/intro.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = height - 110;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          title: Text("DraDol",style: TextStyle(letterSpacing: 2,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Pacifico")),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pink,Colors.blue
              ]
            )
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 40,
                  child: Text("  Let's Learn,\n  By Drag & Drop.",style: TextStyle(letterSpacing: 1.4,height: 1.5,color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "Pacifico"))),
                DraggableScrollableSheet(
                   initialChildSize: 0.6,
                    minChildSize: 0.6,
                    maxChildSize: 0.8,
                    builder: (context,scrollController){
                      return ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(45),topLeft:Radius.circular(45)),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: ScrollPhysics(),
                            child: Column(
                                children: [
                                  Row(children: [
                                      Expanded(child: blocks(context, "Match Colors", "25646-numag-color-copy.json", ColorGame())),
                                      Expanded(child: blocks(context, "Match Words", "25578-letter-l.json", Wordgame()))
                                    ],
                                  ),
                                  Row(children: [
                                    Expanded(child:blocks(context, "Fruit Color", "4659-avocad-bros.json", Game())),
                                    Expanded(child: blocks(context, "Match Symbols", "25172-pencil-loader.json", Symbols())),
                                    ],
                                  ),
                                  Row(children: [
                                        Expanded(child: blocks(context, "Numbers Match", "numbers.json", Numbers())),
                                        Expanded(child: blocks(context, "Poems", "8060-headphone.json", Poemslist()),),
                                      ]),
                                  Row(children: [
                                      Expanded(child: blocks(context, "Memory Game", "memory.json", Memorygame()),),
                                      Expanded(child: blocks(context,"Word Match" ,"25578-letter-l.json" , Wordgame()),                                    ),
                                    ],
                                  ),
                                ]),
                        ),
                      );
                    },
                  ),
            ],
          ),
        ));
  }
}


Widget blocks(BuildContext context,String label,String imgUrl,Widget page){
  double height = MediaQuery.of(context).size.height;
  height = height - 110;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height/2.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.teal),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/$imgUrl'),
          SizedBox(height:10),
          FlatButton(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue,width: 2.5),borderRadius: BorderRadius.circular(10)),
            child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            onPressed: () => Navigator.push(context,pageAnimation(pageName:page)),
          ),
        ],
      ),
    ),
  );
}