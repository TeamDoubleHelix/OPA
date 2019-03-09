

import 'package:flutter/material.dart';
import 'package:opa/Friends.dart';
import 'package:opa/Time.dart';
import 'package:opa/button.dart';

import 'package:opa/sosPage.dart';

class HomeScreen extends StatelessWidget {
HomeScreen(this.name);
final String name;
  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    "Merħba $name",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body2,
                    textScaleFactor: 3.7,
                  ),
                ),
                Row(
                  children: <Widget>[

                      TimeClass(),


                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 70,
                    ),

          
                    
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
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
              MyButton(
                  Icons.event_available, Colors.teal, 'Events', false, () {}),
              MyButton(
                  Icons.smoking_rooms, Colors.blue, 'Puzzles', false, () {}),
              MyButton(Icons.people, Colors.orange, 'Friends',
                  false, () {
                     Navigator.push(context, MaterialPageRoute( builder: (context)=> Friends()));
                  }),
              MyButton(Icons.local_hospital, Colors.red[700], 'S.O.S', true, () {
                Navigator.push(context, MaterialPageRoute( builder: (context)=> SOSPage()));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
