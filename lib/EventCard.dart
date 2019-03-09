import 'package:flutter/material.dart';
import 'pageCard.dart';

class EventCard extends PageCard{

  final String _text, _body;
  final TextStyle _style, _bodyStyle;

  EventCard(this._text, this._style, this._body, this._bodyStyle);

  Widget buildInternal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(_text, style: _style),
        Divider(),
        Text(_body, style: _bodyStyle),
      ],
    );
  }
    
}