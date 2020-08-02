import 'package:DraDol/Poem/intro.dart';
import 'package:DraDol/animations/pageAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';


class Afterintro extends StatefulWidget {
  Afterintro({this.lines, this.id,this.title});
  final List<String> lines;
  final int id;
  String title;
  @override
  _AfterintroState createState() => _AfterintroState();
}

class _AfterintroState extends State<Afterintro> {
  Timer timer;
  int index = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (index < widget.lines.length - 1) {
        setState(() {
          index++;
        });
      }
      if (index == widget.lines.length - 1) {
        timer.cancel();
        Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, pageAnimation(pageName:Poemslist())));

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
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(letterSpacing: 1.3,fontSize: 20,fontFamily: "Lobster",color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(90)),
        child: Container(
          color:Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Container(
                    child: Hero(tag:widget.id,
                        child: Lottie.asset("assets/${widget.id}ani.json",height: height/2,width: double.maxFinite)),
                  ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left:10),
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 900),
                      child: Text(
                        widget.lines[index],
                        key: ValueKey(widget.lines[index]),
                        textAlign: TextAlign.center,
                        style: TextStyle(letterSpacing: 1.3,
                          fontFamily: "Lobster",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),),
                ),
              ],
            ),
        ),
      ),

    );
  }
}
