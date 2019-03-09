import 'package:flutter/material.dart';

class FlagReturn extends StatefulWidget {
  @override
  _FlagReturnState createState() => _FlagReturnState();
}

class _FlagReturnState extends State<FlagReturn> {
  bool english = true;

  void changeFlag(){
    setState(() {
      
     english = false;
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: FlatButton(child: Icon(Icons.flag),
      onPressed: (){changeFlag();},),
    );
  }
}

class Flag extends StatelessWidget {
  
  Flag(this.english);
  final bool english;

  @override
  Widget build(BuildContext context) {
      if (english == false) {
         print("vv");
    return Icon(Icons.access_alarm);
   
  }else{
    return Icon(Icons.ac_unit);
  }
  }
}