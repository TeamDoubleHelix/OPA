import 'package:flutter/material.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/sosPage.dart';

class Events extends StatelessWidget {

  EventDetails event;
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SOSPage()),
  );},
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _eventBuilder(int index, BuildContext context){
    return Column(
      children: <Widget>[Text("hello", style: Theme.of(context).textTheme.display2), Text("this is event $index", style: Theme.of(context).textTheme.display2)],
    );
  }
}
