import 'package:flutter/material.dart';
import 'package:kidsgame/Poem/afterintro.dart';
import 'poemclass.dart';

class Poemslist extends StatelessWidget {
  final List<Poemclass> mylist = [
    Poemclass(
      id: 1,
      name: 'twinkle twinkle',
      lines: [
        "twinkle twinkle little star",
        "how i wonder what you are",
        "up above the world so high",
        "like a diamond in the sky"
      ],
    ),
    Poemclass(
      id: 2,
      name: 'ba ba blacksheep',
      lines: [
        "Baa, baa, black sheep",
        "Have you any wool?",
        "Yes, sir, yes, sir",
        "Three bags full",
        "One for the master",
        "And one for the dame",
        "One for the little boy",
        "Who lives down the lane"
      ],
    ),
    Poemclass(
      id: 3,
      name: 'five little ducklings',
      lines: [
        "Five little ducks Went out one day",
        "Over the hill and far away",
        "Mother duck said quack, quack, quack.",
        "But only four little ducks came back.",
        "Four little ducks Went out one day",
        "Over the hill and far away",
        "Mother duck said quack, quack, quack.",
        "But only three little ducks came back.",
        "three little ducks Went out one day",
        "Over the hill and far away",
        "Mother duck said quack, quack, quack.",
        "But only two little ducks came back.",
        "two little ducks Went out one day",
        "Over the hill and far away",
        "Mother duck said quack, quack, quack.",
        "But only one little ducks came back.",
        "one little ducks Went out one day",
        "Over the hill and far away",
        "Mother duck said quack, quack, quack.",
        "And all the five little ducks came back.",
      ],
    ),
    Poemclass(
      id: 4,
      name: " old mcdonald",
      lines: [
        "Old MacDonald had a farm",
        "Ee i ee i o",
        "And on his farm he had some cows",
        "Ee i ee i oh"
            "With a moo-moo here",
        "And a moo-moo there",
        "Here a moo, there a moo",
        "Everywhere a moo-moo"
      ],
    ),
    Poemclass(
      id: 5,
      name: 'jack and jill',
      lines: [
        "Jack and Jill went up the hill",
        "To fetch a pail of water",
        "Jack fell down and broke his crown",
        "And Jill came tumbling after",
        "Up Jack got, and home did trot",
        "As fast as he could caper",
        "He went to bed to mend his head",
        "With vinegar and brown paper"
      ],
    ),
    Poemclass(
      id: 6,
      name: "wheel on the bus",
      lines: [
        "The wheels on the bus go round and round",
        "Round and round",
        "Round and round",
        "The wheels on the bus go round and round",
        "All through the town",
        "The wipers on the bus go Swish, swish, swish",
        "Swish, swish, swish",
        "Swish, swish, swish",
        "The wipers on the bus go Swish, swish, swish",
        "All through the town",
        "The horn on the bus goes Beep, beep, beep",
        "Beep, beep, beep",
        "Beep, beep, beep",
        "The horn on the bus goes Beep, beep, beep",
        "All through the town"
      ],
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
                      builder: (context) => Afterintro(
                            lines: mylist[index].lines,
                            id: mylist[index].id,
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
