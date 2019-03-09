import 'package:flutter/material.dart';
import 'package:opa/Time.dart';
import 'package:opa/alertMessageButtons.Dart';


class AlertMessage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
        verticalDirection: VerticalDirection.up,
        children: <Widget>[

          Container(
            color:Color(0xFF62b0ff) ,
            height: 150.0,
            ),
          
          AlertButtons(Colors.amber, "Jien Qomt!"),
          
          Expanded(
              child: Container(
                width: double.infinity,
            color: Color(0xFF62b0ff),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,20.0),
                  child: new Image(image: new AssetImage("assets/output.gif")),
                ),
                TimeClass(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
