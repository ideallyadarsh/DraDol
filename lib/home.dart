import 'package:flutter/material.dart';
import 'package:kidsgame/colors.dart';
import 'package:kidsgame/colmatch.dart';
import 'package:kidsgame/symbols.dart';
import 'package:kidsgame/wordmatch.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    height = height - 90;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                        child: FlatButton(
                          child: Lottie.asset(
                              'assets/25646-numag-color-copy.json'),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ColorGame())),
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
                        child: FlatButton(
                          child: Lottie.asset('assets/25578-letter-l.json'),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wordgame())),
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
                        child: FlatButton(
                          child: Lottie.asset('assets/4659-avocad-bros.json'),
                          onPressed: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Game())),
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
                        child: FlatButton(
                          child:
                              Lottie.asset('assets/25172-pencil-loader.json'),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Symbols()),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
