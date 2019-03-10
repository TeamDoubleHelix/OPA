import 'package:flutter/material.dart';
import 'package:opa/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sms/sms.dart';

class AlertButtons extends StatelessWidget {
  AlertButtons(this.buttonColor, this.buttonText);
  final Color buttonColor;
  final String buttonText;

  static SmsSender sender = new SmsSender();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.amber,
      elevation: 15.0,
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        sender.sendSms(new SmsMessage("79081300", 'Aw pa qomt bro!'));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen("John")));
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
