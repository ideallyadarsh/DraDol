import 'package:flutter/material.dart';
import 'poem.dart';
import 'poemscreen.dart';

class Poemlist extends StatelessWidget {
  final List<Poem> mylist = [
    Poem(
        url: 'https://www.youtube.com/watch?v=yCjJyiqpAuU',
        name: 'Twinkle Twinkle'),
    Poem(
      url: 'https://www.youtube.com/watch?v=F4tHL8reNCs',
      name: 'johny johny yes papa',
    ),
    Poem(
      url: 'https://www.youtube.com/watch?v=h1fiPIhGXYA',
      name: 'humpty dumpty',
    ),
    Poem(
      name: 'ba ba black sheep',
      url: 'https://www.youtube.com/watch?v=MR5XSOdjKMA',
    ),
    Poem(
      name: 'five little ducks',
      url: 'https://www.youtube.com/watch?v=-ccCPcujnys',
    ),
    Poem(
      name: 'rain rain go away',
      url: 'https://www.youtube.com/watch?v=nCqUYAnQF0o',
    ),
    Poem(
      name: 'wheel on the bus',
      url: 'https://www.youtube.com/watch?v=e_04ZrNroTo',
    ),
    Poem(name: 'jai hind', url: 'https://www.youtube.com/watch?v=PKYjUOwAk38'),
    Poem(
      name: 'old mcdonald',
      url: 'https://www.youtube.com/watch?v=dpnUYVezBVw',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("poems for you"),
      ),
      body: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
                child: ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Poemscreen(
                            url: mylist[index].url,
                          ))),
                  title: Text(mylist[index].name),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/star.jpeg'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
