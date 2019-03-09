import 'package:flutter/material.dart';
import 'package:opa/homeScreen.dart';

class AlertButtons extends StatelessWidget {
  AlertButtons(this.buttonColor, this.buttonText);
  final Color buttonColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.amber,
elevation: 15.0,
      padding: EdgeInsets.all(0.0),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute( builder: (context)=> HomeScreen("Cettuno")));
      },
          child: Container(
          height: 215.0,
          width: double.infinity,
          // color: buttonColor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text(
                "${this.buttonText}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2,
                textScaleFactor: 3.7,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          )),
    );
  }
}
