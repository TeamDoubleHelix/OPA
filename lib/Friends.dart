import 'package:flutter/material.dart';
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
  List<Person> people = [
    Person('Harry', 21324675),
    Person('Mary', 46372876),
    Person('Jack', 473829384)
  ];

  @override
  void initState() {
    super.initState();

    style = new TextStyle(fontSize: 30);
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
        itemCount: people.length,
        itemBuilder: (context, index) {
          return Profile(people[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ), 
    );
  }
}
