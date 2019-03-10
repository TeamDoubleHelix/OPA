import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opa/alertDialog.dart';
import 'package:tts/tts.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  var backColour = Colors.deepOrange, accentColour = Colors.red;
  bool phoned = false;

  Timer _timer;
  int _start = 10;

  void startTimer() {
    _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
                Tts.speak("Beginning call...");
                Alert.showAlert(context, "Phoning Relative", "...");
                canLaunch("tel:79081300").then((l) {
                  if (l) launch("tel://79081300");
                });
                phoned = true;
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
          if (!phoned) Tts.speak("Cancelling phone call...");
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
