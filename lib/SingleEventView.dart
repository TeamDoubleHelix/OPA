import 'package:flutter/material.dart';
import 'package:opa/EventCard.dart';
import 'package:opa/EventDetails.dart';

class SingleEventView extends StatelessWidget {
  final EventDetails details;

  SingleEventView(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(details.title)),
        body: Column(
          children: <Widget>[
            _titleBodyCard("About", details.description,
                icon: Icons.question_answer),
            _titleBodyCard("Organiser", details.organiser),
            _titleBodyCard("Location", details.location,
                icon: Icons.location_on),
            _going(details.going),
            _attend(),
          ],
        ));
  }

  Card _titleBodyCard(String title, String body,
      {titleStyle = const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      bodyStyle = const TextStyle(fontSize: 24),
      IconData icon}) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            icon != null
                ? iconText(icon, title, titleStyle)
                : Text(title, style: titleStyle),
            Divider(),
            Text(body, style: bodyStyle),
          ],
        ),
      ),
    );
  }

  Row iconText(IconData icon, String text, TextStyle style) {
    return Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
            child: Icon(icon)),
        Text(text, style: style),
      ],
    );
  }

  Widget _attend() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Going!", style: TextStyle(fontSize: 34),),
            ),
            color: Colors.green,
            onPressed: () {},
          ),
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Need Transport!", style: TextStyle(fontSize: 34), ),
            ),
            color: Colors.amber,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _going(List<String> people,
      {titleStyle = const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      bodyStyle = const TextStyle(fontSize: 24)}) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("Going", style: titleStyle),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: people.length,
            itemBuilder: (context, index) {
              return Padding(padding:EdgeInsets.all(5.0), child: Text(people[index], style: bodyStyle,));
            },
          )
        ],
      ),
    );
  }
}
