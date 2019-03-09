import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tts/tts.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  var backColour = Colors.deepOrange, accentColour = Colors.red;

  Timer _timer;
  int _start = 10;

  void startTimer() {
    _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
                Tts.speak("Beginning call...");
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Phoning Relative"),
                      content: new Text("..."),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                _start = _start - 1;
                if (_start < 6) Tts.speak("$_start");
              }
            }));
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    Tts.speak("Calling for help. Tap anywhere to cancel.");
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: GestureDetector(
        onTap: () {
          Tts.speak("Cancelling phone call...");
          Navigator.of(context).pop();
        },
        child: Container(
            color: backColour,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone_in_talk,
                  size: 120,
                ),
                Container(
                  height: 20,
                ),
                textCard(Theme.of(context).textTheme.body1, 4, "$_start"),
                Container(
                  height: 20,
                ),
                textCard(Theme.of(context).textTheme.body2, 4,
                    "Tap anywhere to cancel."),
              ],
            )),
      ),
    );
  }

  Card textCard(var style, double sf, var text) {
    return new Card(
      elevation: 8,
      color: accentColour,
      child: Padding(
        padding: EdgeInsets.all(9),
        child: Text(
          text,
          style: style,
          textScaleFactor: sf,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
