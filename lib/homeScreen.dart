import 'package:flutter/material.dart';
import 'package:opa/EventViewer.dart';
import 'package:opa/Friends.dart';
import 'package:opa/button.dart';
import 'package:intl/intl.dart';
import 'package:opa/sosPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static var now = new DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "BONGU ",
                    style: Theme.of(context).textTheme.body2,
                    textScaleFactor: 3.7,
                  ),
                ),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.body2,
                  textScaleFactor: 3.5,
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.amber),
            width: double.infinity,
          ),
          GridView.count(
            mainAxisSpacing: 15.0,
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: <Widget>[
              MyButton(Icons.calendar_view_day, Colors.teal, 'Events', false,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventViewer()),
                );
              }),
              MyButton(
                  Icons.insert_emoticon, Colors.blue, 'Puzzles', false, () {}),
              MyButton(Icons.perm_contact_calendar, Colors.orange, 'Friends',
                  false, () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Friends()),
                );}),
              MyButton(Icons.accessible, Colors.red[700], 'S.O.S', true, () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SOSPage()),
                );}),
            ],
          ),
        ],
      ),
    );
  }
}
