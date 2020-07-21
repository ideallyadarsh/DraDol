import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:kidsgame/home.dart';

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  final Map<String, bool> score = {};
  Map word = {'1': 'One',    '2': 'Two',    '3': 'Three',    '4': 'Four',    '5': 'Five',    '6': 'Six',    '7': 'Seven', '8': 'Eight',    '9':'Nine', '10':'Ten',};
  Map word1= {'11': 'Eleven', '12': 'Twelve', '13': 'Thirteen', '14': 'Fourteen', '15': 'Fiveteen', '16': 'Sixteen','17': 'Seventeen', '18': 'Eightteen', '19':'Nineteen', '20':'Twenty',};
  Map word2 = {'21': 'Twenty One',    '22': 'Twenty Two',    '23': 'Twenty Three',    '24': 'Twenty Four',    '25': 'Twenty Five',    '26': 'Twenty Six',    '27': 'Twenty Seven', '28': 'Twenty Eight',    '29':'Twenty Nine', '30':'Thirty',};
  Map word3 = {'31': 'Thirty One',    '32': 'Thirty Two',    '33': 'Thirty Three',    '34': 'Thirty Four',    '35': 'Thirty Five',    '36': 'Thirty Six',    '37': 'Thirty Seven', '38': 'Thirty Eight',    '39':'Thirty Nine', '40':'Fourty',};
  Map word4 = {'41': 'Fourty One',    '42': 'Fourty Two',    '43': 'Fourty Three',    '44': 'Fourty Four',    '45': 'Fourty Five',    '46': 'Fourty Six',    '47': 'Fourty Seven', '48': 'Fourty Eight',    '49':'Fourty Nine', '150':'Fifty',};
  Map word5 = {'51': 'Fifty One',    '52': 'Fifty Two',    '53': 'Fifty Three',    '54': 'Fifty Four',    '55': 'Fifty Five',    '56': 'Fifty Six',    '57': 'Fifty Seven', '58': 'Fifty Eight',    '59':'Fifty Nine', '60':'Sixty',};
  Map word6 = {'61': 'Sixty One',    '62': 'Sixty Two',    '63': 'Sixty Three',    '64': 'Sixty Four',    '65': 'Sixty Five',    '66': 'Sixty Six',    '67': 'Sixty Seven', '68': 'Sixty Eight',    '69':'Sixty Nine', '10':'Ten',};
  Map word7 = {'71': 'Seventy One',    '72': 'Seventy Two',    '73': 'Seventy Three',    '74': 'Seventy Four',    '75': 'Seventy Five',    '76': 'Seventy Six',    '77': 'Seventy Seven', '78': 'Seventy Eight',    '79':'Seventy Nine', '80':'Eighty ',};
  Map word8 = {'81': 'Eighty One',    '82': 'Eighty Two',    '83': 'Eighty Three',    '84': 'Eighty Four',    '85': 'Eighty Five',    '86': 'Eighty Six',    '87': 'Eighty Seven', '88': 'Eighty Eight',    '89':'Eighty Nine', '90':'Ninety',};
  Map word9 = {'91': 'Ninety One',    '92': 'Ninety Two',    '93': 'Ninety Three',    '94': 'Ninety Four',    '95': 'Ninety Five',    '96': 'Ninety Six',    '97': 'Ninety Seven', '98': 'Ninety Eight',    '99':'Ninety Nine', '100':'Hundred',};

  String level = 'I';
   int i=0;
  int seed = 2;
  AudioCache _audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = height - 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            icon: Icon(Icons.home,size: 30,),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Symbol Match ",
            style: TextStyle(fontFamily: "Lobster",color: Colors.white),
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
              "Match The Digit With the Spelling\nLevel:$level",
              style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Score: ", style: TextStyle(fontFamily: "Pacifico",fontSize: 20, color: Colors.red),),
              Text("${score.length}", style: TextStyle(fontFamily: "Lobster",fontSize: 35, color: Colors.green),),
              Text(" /10", style: TextStyle(fontSize: 20, color: Colors.black),),
            ],),

            SizedBox(
              height: 20,
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
                      child: display(context, score[words] == true ? '✔' : words),
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
        backgroundColor: Colors.pink,
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
            padding: const EdgeInsets.all(3.0),
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
              height: height / 12,
              width: 150,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                word[words],
                style: TextStyle(fontSize: 19,fontFamily: "Lobster"),
              ),
              height: height / 12,
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
          if (score.length == 10) {
            i++;
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
              "Score=10/10",
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  Image.asset("assets/success.gif"),
                  FlatButton(
                      color: Colors.pink,
                      child: i<10?Text("Next Level"):Text("Completed!"),
                      onPressed: () {
                          print("Set state dialogue");
                          if(i<10){
                            switch(i){
                              case 1:{setState(() {level='II';word=word1;score.clear();});
                              } break;
                              case 2:{setState(() {
                                score.clear();level='III';word=word2;
                              });}break;
                              case 3:{setState(() {
                                level='IV';score.clear();word=word3;
                              });}break;
                              case 4:{setState(() {
                                level='V';word=word4;score.clear();
                              });}break;
                              case 5:{setState(() {
                                level='VI';word=word5;score.clear();
                              });}break;
                              case 6:{setState(() {
                                word=word6;level='VII';score.clear();
                              });}break;
                              case 7:{setState(() {
                                score.clear();word=word7;level='VIII';
                              });}break;
                              case 8:{setState(() {
                                score.clear();word=word8;level='IX';
                              });}break;
                              case 9:{setState(() {
                                score.clear();word=word9;level='X';
                              });}break;
                              default:break;
                            }
                            Navigator.pop(context);
                          }
                        else
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Home()));
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
      padding: const EdgeInsets.all(3.0),
      child: Container(
        alignment: Alignment.center,
        height: height / 12,
        width: 125,
        child: Text(emoji, style: TextStyle(fontFamily: 'Pacifico',color: Colors.black, fontSize: 20),
        ),
      ),
    ),
  );
}
