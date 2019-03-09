import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/EventCard.dart';
import 'pageCard.dart';

class Page extends StatelessWidget {
  PageModel _model;
  final double _opacity;

  Page(this._opacity, List<EventDetails> eventsToday, int dayOfWeek) {
    var cards = List<PageCard>();
    for (int i = 0; i < eventsToday.length; i++) {
      cards.add(new EventCard(
        eventsToday[i].title,
        TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        eventsToday[i].description,
        TextStyle(fontSize: 24),
      ));
    }

    _model = new PageModel(Colors.white, cards, dayOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: this._opacity,
      child: Container(
        width: double.infinity,
        color: _model.colour,
        child: ListView.builder(
          itemCount: _model.cards.length + 1,
          itemBuilder: (context, index) {
            if (index != 0)
              return Transform(
                transform: Matrix4.translationValues(
                    (100.0 * (index)) * (1 - _opacity), 0, 0),
                child: _model.cards[index - 1].build(context),
              );
            else
              return Transform(
                transform: Matrix4.translationValues(
                    (100.0 * (index)) * (1 - _opacity), 0, 0),
                child: Card(
                  elevation: 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(_parseWeekday(_model.dayOfWeek),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              );
          },
        ),
      ),
    );
  }

  String _parseWeekday(int day) {
    switch (day) {
      case 1:
      case 8:
        return "Monday";
      case 2:
      case 9:
        return "Tuesday";
      case 3:
      case 10:
        return "Wednesday";
      case 4:
      case 11:
        return "Thursday";
      case 5:
      case 12:
        return "Friday";
      case 6:
      case 13:
        return "Saturday";
      case 0:
      case 7:
        return "Sunday";
    }
  }
}

class PageModel {
  final Color colour;
  final List<PageCard> cards;
  final int dayOfWeek;

  PageModel(this.colour, this.cards, this.dayOfWeek);
}
