import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/FirebaseHandler.dart';
import 'package:tts/tts.dart';
import './Profile.dart';

class Friends extends StatefulWidget {
  Friends({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FriendsState createState() => _FriendsState();
}

class Person {
  String name;
  int number;

  Person(String na, int nu) {
    name = na;
    number = nu;
  }
}

class _FriendsState extends State<Friends> {
  TextStyle style;
  List<Person> people;

  @override
  void initState() {
    super.initState();

    FirebaseHandler.getPeople().then((p) => setState(() {
          people = p;
        }));

    style = new TextStyle(fontSize: 30);
    Tts.speak("Friends list");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'Friends',
          textScaleFactor: 2.7,
        ),
      ),
      body: ListView.builder(
        itemCount: people == null ? 1 : people.length,
        itemBuilder: (context, index) {
          if (people != null)
            return Profile(people[index]);
          else
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center( child: CircularProgressIndicator()),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseHandler.addEvent(EventDetails.eventsWednesday[0]);
          FirebaseHandler.addEvent(EventDetails.eventsWednesday[1]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
