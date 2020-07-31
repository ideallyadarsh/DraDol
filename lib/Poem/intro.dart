import 'package:flutter/material.dart';
import '../home.dart';
import 'afterintro.dart';
import 'package:lottie/lottie.dart';
import 'poemclass.dart';

class Poemslist extends StatelessWidget {
  final List<Poemclass> mylist = [
    Poemclass(
      id: 1,
      name: 'Twinkle Twinkle',
      lines: [
        "twinkle twinkle little star",
        "how i wonder what you are",
        "up above the world so high",
        "like a diamond in the sky",
        'When the blazing sun is gone' ,
        'When he nothing shines upon' ,
        'Then you show your little light',
        'Twinkle, twinkle, all the night'   ,
        'Then the traveler in the dark',
        'Thanks you for your tiny spark',
        'How could he see where to go',
        'If you did not twinkle so?',
        'In the dark blue sky you keep',
        'Often through my curtains peep',
        'For you never shut your eye',
        'Till the sun is in the sky',
        'As your bright and tiny spark',
        'Lights the traveler in the dark',
        'Though I know not what you are',
        'Twinkle, twinkle, little star'
      ],
    ),
    Poemclass(
      id: 2,
      name: 'Ba Ba Blacksheep',
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
      name: 'Five Little Ducklings',
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
      name: " Old Mcdonald",
      lines: [
        "Old MacDonald had a farm",
        "Ee i ee i o",
        "And on his farm he had some cows",
        "Ee i ee i oh",
        "With a moo-moo here",
        "And a moo-moo there",
        "Here a moo, there a moo",
        "Everywhere a moo-moo"
      ],
    ),
    Poemclass(
      id: 5,
      name: 'Jack and Jill',
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
      name: "Wheel on the Bus",
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
    Poemclass(
      id: 7,
      name: "Marry had a little Lamb",
      lines: [
        "Mary had a little lamb",
        "Little lamb, little lamb",
        "Mary had a little lamb",
        "Its fleece was white as snow",
        "And every where that Mary went",
        "Mary went, Mary went",
        "Everywhere that Mary went",
        "The lamb was sure to go",
        "He followed her to school one day",
        "School one day, school one day",
        "He followed her to school one day",
        "Which was against the rule",
        "It made the children laugh and play",
        "Laugh and play, laugh and play",
        "It made the children laugh and play",
        "To see a lamb at school",
        "And so the teacher turned him out",
        "Turned him out, turned him out",
        "So the teacher turned him out",
        "But still he lingered near",
        "And waited patiently about",
        "Patiently about, patiently about",
        "Till Mary did appear",
        "Why does the lamb love Mary so",
        "Mary so, Mary so",
        "Why does the lamb love Mary so",
        "The eager children cried",
        "Why Mary loves the lamb, you know",
        "Lamb you know, lamb you know",
        "Why Mary loves the lamb, you know",
        "The teacher did reply",
        "Mary had a little lamb",
        "Little lamb, little lamb",
        "Mary had a little lamb",
        "Its fleece was white as snow"
      ],
    ),
    Poemclass(
      id: 8,
      name: "Johny Johny Yes Papa",
      lines: [
        "johny johny yes papa",
        "eating sugar ? no papa",
        "telling lie ? no papa",
        "open your mouth",
        "ha ha ha"
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(icon: Icon(Icons.home,size: 30,), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),),
            SizedBox(width: 10,),
            Text("Poems", style: TextStyle(color: Colors.white),),
          ]),
        ),
      body: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/9,
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Afterintro(
                              lines: mylist[index].lines,
                              id: mylist[index].id,
                             title: mylist[index].name,
                            ))),
                    title: Text(mylist[index].name,style: TextStyle(letterSpacing: 1.3,color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Lobster")),
                    leading: Hero(tag: mylist[index].id,
                        child: Lottie.asset('assets/${mylist[index].id}ani.json',fit: BoxFit.fitHeight ),
                    )
                  ),
                ),
            );
          }),
    );
  }
}
