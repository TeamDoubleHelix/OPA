import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opa/homeScreen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          
         body2: TextStyle(color: Colors.black) ,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen("Cettina"),
      ),
    );
  }
}