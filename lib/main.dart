import 'package:flutter/material.dart';
import 'package:opa/EventViewer.dart';
import 'package:opa/Friends.dart';
import 'package:flutter/services.dart';
import 'package:opa/alertMessage.dart';
import 'package:opa/homeScreen.dart';
import './Plant.dart';
import './Puzzles.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elderly',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Elderly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Friends(),
    
    );
      
  }
}