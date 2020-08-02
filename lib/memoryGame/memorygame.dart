import 'package:flutter/material.dart';
import 'package:DraDol/home.dart';
import 'tilemodel.dart';
import 'data.dart';
import 'dart:async';

class Memorygame extends StatefulWidget {
  @override
  _MemorygameState createState() => _MemorygameState();
}

class _MemorygameState extends State<Memorygame> {
  List<TileModel> gridViewTiles = List<TileModel>();
  List<TileModel> questionPairs = List<TileModel>();
  String title="Remember the Pair Positions";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 10), () {
// Here you can write your code
      setState(() {
        title="Start Finding the pairs";
        print("2 seconds done");
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text("Memory ", style: TextStyle(fontFamily: "Lobster",color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: <Widget>[
                Text(points!=800?title:" ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 15,
                ),
                points != 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Score: ", style: TextStyle(fontFamily: "Pacifico",fontSize: 20, color: Colors.red),),
                              Text("$points", style: TextStyle(fontFamily: "Lobster",fontSize: 35, color: Colors.green),),
                              Text(" /800", style: TextStyle(fontSize: 20, color: Colors.black),),
                            ],),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                points != 800
                    ? GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                        children: List.generate(gridViewTiles.length, (index) {
                          return Tile(
                            imagePathUrl:
                                gridViewTiles[index].getImageAssetPath(),
                            tileIndex: index,
                            parent: this,
                          );
                        }),
                      )
                    : Container(
                        child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                points = 0;
                                reStart();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pinkAccent,Colors.blueAccent
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                "Replay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: FlatButton(
                                onPressed:()=> Navigator.pop(context),
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String imagePathUrl;
  final int tileIndex;
  final _MemorygameState parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis" + widget.imagePathUrl);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.all(5),
          child: myPairs[widget.tileIndex].getImageAssetPath() != ""
              ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                  ? myPairs[widget.tileIndex].getImageAssetPath()
                  : widget.imagePathUrl)
              : Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      color: Colors.white,
                      child: Text("✔",style: TextStyle(color: Colors.green,fontSize: 25),),
                    ),
                ),
              ),
        ),
      ),
    );
  }
}
