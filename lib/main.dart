import 'package:flutter/material.dart';
import 'package:opa/EventViewer.dart';
import 'package:opa/Friends.dart';
import 'package:flutter/services.dart';
import 'package:opa/Texts.dart';
import 'package:opa/alertMessage.dart';
import 'package:opa/flag.dart';
import 'package:opa/homeScreen.dart';
import './Plant.dart';
import './Puzzles.dart';
import 'package:tts/tts.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Texts.initialise(false);
    Tts.speak(Texts.openApp("John"));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elderly',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primaryColor: Colors.teal[400],
        accentColor: Colors.teal[400],
      ),
      home: AlertMessage(),
    );
  }
}
