import 'package:flutter/material.dart';
import 'package:kidsgame/Numbers.dart';
import 'package:kidsgame/colors.dart';
import 'package:kidsgame/colmatch.dart';
import 'package:kidsgame/symbols.dart';
import 'package:kidsgame/wordmatch.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = height - 110;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("DraDol",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Pacifico")),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/25646-numag-color-copy.json'),
                            SizedBox(height:10),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Colour Match"),
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => ColorGame())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Lottie.asset('assets/25578-letter-l.json'),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Word Match"),
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => Wordgame())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Lottie.asset('assets/4659-avocad-bros.json'),
                            SizedBox(height: 50,),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Fruit Colour"),
                              onPressed: () => Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => Game())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Lottie.asset('assets/25172-pencil-loader.json'),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Symbol Match"),
                              onPressed: () => Navigator.push(
                                context,MaterialPageRoute(builder: (context) => Symbols()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/25646-numag-color-copy.json'),
                            SizedBox(height:10),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Numbers Match"),
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => Numbers())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/25578-letter-l.json'),
                            FlatButton(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(10)),
                              child: Text("Word Match"),
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => Wordgame())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
     );
   }
 }
