import 'package:flutter/material.dart';
import 'package:kidsgame/poemlist.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Poemscreen extends StatefulWidget {
  Poemscreen({@required this.url});
  final String url;
  @override
  _PoemscreenState createState() => _PoemscreenState();
}

class _PoemscreenState extends State<Poemscreen> {
  String youlink;
  _PoemscreenState({this.youlink});

  String videourl = 'https://www.youtube.com/watch?v=yCjJyiqpAuU';
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          YoutubePlayer(
            controller: _controller,
          ),
          FlatButton(
            child: Text("Back"),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Poemlist())),
          ),
        ],
      ),
    );
  }
}
