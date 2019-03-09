import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/SingleEventView.dart';
import 'package:tts/tts.dart';
import 'pageCard.dart';

class EventCard extends PageCard {
  final EventDetails _details;
  TextStyle _style, _bodyStyle;

  EventCard(this._details,
      {titleStyle = const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
      bodyStyle = const TextStyle(fontSize: 36)}) {
    _style = titleStyle;
    _bodyStyle = bodyStyle;
  }

  Widget buildInternal(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Tts.speak("${_details.title} : ${_details.description}");
      },
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingleEventView(_details)),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_details.title, style: _style),
          Divider(),
          Text(_details.description, style: _bodyStyle),
        ],
      ),
    );
  }
}
