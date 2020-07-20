import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:kidsgame/home.dart';

class Symbols extends StatefulWidget {
  @override
  _SymbolsState createState() => _SymbolsState();
}

class _SymbolsState extends State<Symbols> {
  final Map<String, bool> score = {};
  Map word = {
    '■': 'Square',
    '▬': 'Rectangle',
    '▲': 'Triangle',
    '●': 'Circle',
    '◚': 'Semi Circle',
    '◆': 'Diamond',
    '♥': 'Heart',
    '★': 'Star',
  };

  String level = 'I';

  int seed = 0;
  AudioCache _audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = height - 200;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Symbol Match ",
            style: TextStyle(color: Colors.white),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Match The Symbol With the Word",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Your Score:${score.length}/8",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: word.keys.map((words) {
                    return Draggable<String>(
                      data: words,
                      child:
                          display(context, score[words] == true ? '✔' : words),
                      feedback: display(context, words),
                      childWhenDragging: display(context, '🤔'),
                    );
                  }).toList()
                    ..shuffle(Random(seed + 3)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      word.keys.map((words) => buildDragTarget(words)).toList()
                        ..shuffle(Random(seed)),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Refresh",
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
    );
  }

  Widget buildDragTarget(words) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        double height = MediaQuery.of(context).size.height;
        height = height - 200;
        if (score[words] == true) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Colors.transparent,
              child: Text(
                "Correct",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.centerRight,
              height: height / 9,
              width: 150,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                word[words],
                style: TextStyle(fontSize: 17),
              ),
              height: height / 9,
              width: 150,
            ),
          );
        }
      },
      onWillAccept: (data) => data == words,
      onAccept: (data) {
        print(data);
        setState(() {
          score[words] = true;
          if (score.length == 8) {
            dialogue(context);
          }
        });
        _audioCache.play("successful.mp3");
      },
      onLeave: (data) {},
    );
  }

  dialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Score=8/8",
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  Image.asset("assets/success.gif"),
                  FlatButton(
                      color: Colors.pink,
                      child: Text("Next Level"),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }),
                ],
              ),
            ],
          );
        });
  }
}

Widget display(BuildContext context, emoji) {
  double height = MediaQuery.of(context).size.height;
  height = height - 200;
  return Material(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment.center,
        height: height / 9,
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    ),
  );
}
