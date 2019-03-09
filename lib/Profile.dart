import 'package:flutter/material.dart';
import 'package:tts/tts.dart';
import './Friends.dart';

class Profile extends StatelessWidget {
  final Person p;

  Profile(this.p);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onLongPress: () {
        Tts.speak("${p.name}");
      },
      child: Container(
          height: 90,
          child: Center(
              child: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 70,
              ),
              Text(
                " " + p.name + " ",
                textScaleFactor: 5,
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                  icon: Icon(Icons.call),
                  iconSize: 40,
                  onPressed: () {
                    print('hey');
                  })
            ],
          ))),
    ));
  }
}
