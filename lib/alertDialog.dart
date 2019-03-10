import 'package:flutter/material.dart';
import 'package:tts/tts.dart';

class Alert {
  static void showAlert(BuildContext context, String title, String body) {
    Tts.speak("$title : $body");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(body),
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
  }
}
