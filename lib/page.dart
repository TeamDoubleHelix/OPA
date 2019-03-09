import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/EventCard.dart';
import 'package:opa/SingleEventView.dart';
import 'package:opa/Texts.dart';
import 'pageCard.dart';

class Page extends StatelessWidget {
  PageModel _model;
  final double _opacity;

  Page(this._opacity, List<EventDetails> eventsToday, int dayOfWeek) {
    var cards = List<PageCard>();
    for (int i = 0; i < eventsToday.length; i++) {
      cards.add(new EventCard(
        eventsToday[i],
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
                      child: Text(Texts.parseWeekday(_model.dayOfWeek),
                          style: TextStyle(
                            fontSize: 50,
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
}

class PageModel {
  final Color colour;
  final List<PageCard> cards;
  final int dayOfWeek;

  PageModel(this.colour, this.cards, this.dayOfWeek);
}
