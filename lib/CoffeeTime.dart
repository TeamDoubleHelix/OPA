import 'package:flutter/material.dart';
import 'package:opa/CoffeeOffer.dart';
import 'package:opa/FirebaseHandler.dart';
import 'package:tts/tts.dart';

class CoffeeTime extends StatefulWidget {
  @override
  _CoffeeTimeState createState() => _CoffeeTimeState();
}

class _CoffeeTimeState extends State<CoffeeTime> {
  TextStyle titleStyle =
          const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
      bodyStyle = const TextStyle(fontSize: 36);

  List<CoffeeOffer> offers;

  @override
  void initState() {
    super.initState();

    offers = new List<CoffeeOffer>();
    FirebaseHandler.getOffer().then((o) => setState(() {
          offers = CoffeeOffer.test;
        }));
  }

  @override
  Widget build(BuildContext context) {
    Tts.speak("Meeting up with friends.");

    return ListView.builder(
      itemCount: offers.length + 1,
      itemBuilder: (context, index) {
        if (index != 0)
          return Card(
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  // flutter defined function
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text(
                            "Show this code to the cashier to redeem this voucher!"),
                        content:
                            new Image.network(offers[index - 1].url),
                      );
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Image.network(offers[index - 1].image)),
                    Divider(),
                    Text(offers[index - 1].place, style: titleStyle),
                    Divider(),
                    Text(offers[index - 1].details, style: bodyStyle),
                  ],
                ),
              ),
            ),
          );
        else
          return Card(
            color: Colors.lightGreen,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    "COME TO ME!",
                    style: titleStyle,
                  ),
                  Text(
                    "Invite a friend or volunteer to your house.",
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}
