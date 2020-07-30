import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class Afterintro extends StatefulWidget {
  Afterintro({this.lines, this.id});
  final List<String> lines;
  final int id;
  @override
  _AfterintroState createState() => _AfterintroState();
}

class _AfterintroState extends State<Afterintro> {
  Timer timer;
  int index = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (index < widget.lines.length - 1) {
        setState(() {
          index++;
        });
      }
      if (index == widget.lines.length - 1) {
        timer.cancel();
        print('done');
      }
    });
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text("Poems"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 25, bottom: 50),
                child: Lottie.asset("assets/${widget.id}ani.json"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 900),
                  child: Text(
                    widget.lines[index],
                    key: ValueKey(widget.lines[index]),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lobster",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 25),
              child: FlatButton(
                onPressed: () {},
                child: Text("skip"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
