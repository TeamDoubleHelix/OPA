import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/FirebaseHandler.dart';
import 'package:opa/Texts.dart';
import 'package:opa/page.dart';
import 'package:opa/pageCard.dart';
import 'package:opa/pageDragger.dart';
import 'package:opa/sosPage.dart';
import 'package:tts/tts.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> with TickerProviderStateMixin {

  List<List<EventDetails>> events;

  StreamController<SlideUpdate> slideUpdateStream;
  PseudoPageDragger animatedDragger;
  int activeIndex = 0;
  int nextIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  @override
  void initState() {
    Tts.speak("Events.....Activities on " +
        Texts.parseWeekday(DateTime.now().weekday + activeIndex));
    super.initState();
events = new List<List<EventDetails>>();
    FirebaseHandler.getEvents().then((e) => setState(() => events = e));

    slideUpdateStream = new StreamController<SlideUpdate>();
    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.type == UpdateType.dragging ||
            event.type == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.percent;

          if (slideDirection == SlideDirection.leftToRight)
            nextIndex = activeIndex - 1;
          else if (slideDirection == SlideDirection.rightToLeft)
            nextIndex = activeIndex + 1;
          else
            nextIndex = activeIndex;

          nextIndex.clamp(0.0, events.length - 1);
        } else if (event.type == UpdateType.doneDragging) {
          if (slidePercent > 0.3) {
            animatedDragger = new PseudoPageDragger(slideDirection,
                TransitionGoal.open, slidePercent, slideUpdateStream, this);
          } else {
            animatedDragger = new PseudoPageDragger(slideDirection,
                TransitionGoal.close, slidePercent, slideUpdateStream, this);
          }

          animatedDragger.run();
        } else if (event.type == UpdateType.doneAnimating) {
          if (event.goal == TransitionGoal.manual ||
              event.goal == TransitionGoal.open) {
            if (slideDirection == SlideDirection.leftToRight)
              activeIndex--;
            else
              activeIndex++;
          }

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedDragger.dispose();

          Tts.speak("Activities on " +
              Texts.parseWeekday(DateTime.now().weekday + activeIndex));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        events.length > 0 ? Page(slidePercent, events[nextIndex],
            DateTime.now().weekday + nextIndex) : _placeHolder() ,
        events.length > 0 ? Page((1 - slidePercent), events[activeIndex],
            DateTime.now().weekday + activeIndex) : _placeHolder(),
        Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.all(15),
              child: LinearProgressIndicator(
                value: (activeIndex +
                        1 +
                        (slideDirection == SlideDirection.leftToRight
                            ? -slidePercent
                            : slidePercent)) /
                    (events.length == 0 ? 1 :events.length),
                backgroundColor: Colors.white,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Theme.of(context).primaryColorLight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Submit Event Request",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        PageDragger(slideUpdateStream, activeIndex > 0,
            activeIndex < events.length - 1),
      ],
    );
  }

  Column _eventBuilder(int index, BuildContext context) {
    return Column(
      children: <Widget>[
        Text("hello", style: Theme.of(context).textTheme.display2),
        Text("this is event $index",
            style: Theme.of(context).textTheme.display2)
      ],
    );
  }

  Widget _placeHolder(){
    return Center(child: CircularProgressIndicator(),);
  }
}

/*
Column(
      children: <Widget>[
        Expanded(
          child: _eventBuilder(currentIndex, context),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: (){print("left");},
              ),
            ),
            Expanded(
              flex: 4,
              child: IconButton(
                icon: Icon(Icons.check),
                onPressed: (){print("yes");},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: (){print("right");},
              ),
            ),
          ],
        )
      ],
    ); */
