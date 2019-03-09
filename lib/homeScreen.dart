import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opa/button.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.name);
  final String name;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateFormat dateFormat;
  DateFormat timeFormat;

Timer timer;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('cs');
    timeFormat = new DateFormat.Hm('cs');

    timer = new Timer.periodic(const Duration(seconds : 1), refresh);
    
  }

  void refresh(Timer a) {
    setState(() {
    });
  }

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
                  padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,0.0),
                  child: Text(
                    "Merħba ${widget.name} ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body2,
                    textScaleFactor: 3.7,
                  ),
                ),
                Row( children: <Widget>[
                  Icon(Icons.wb_sunny, size: 70,
               ),
               Icon(Icons.arrow_forward, size: 70),
               Icon(Icons.cloud, size: 70),
                ],
                mainAxisAlignment: MainAxisAlignment.center,),
               
                Text(
                  timeFormat.format(dateTime),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.body2,
                  textScaleFactor: 7,
                  
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
                  Icons.calendar_view_day, Colors.teal, 'Events', false, () {}),
              MyButton(
                  Icons.insert_emoticon, Colors.blue, 'Activity', false, () {}),
              MyButton(Icons.perm_contact_calendar, Colors.orange, 'Friends',
                  false, () {}),
              MyButton(Icons.accessible, Colors.red[700], 'S.O.S', true, () {}),
            ],
          ),
        ],
      ),
    );
  }
}
