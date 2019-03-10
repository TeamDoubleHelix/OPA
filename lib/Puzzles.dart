import 'package:flutter/material.dart';
import 'package:opa/Texts.dart';
import 'package:tts/tts.dart';
import './Plant.dart';

class Puzzles extends StatefulWidget {
  Puzzles({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PuzzlesState createState() => _PuzzlesState();
}

class _PuzzlesState extends State<Puzzles> {
  TextStyle style;
  @override
  void initState() {
    super.initState();
    Tts.speak("Puzzles");
    style = new TextStyle(fontSize: 30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'Puzzles',
          textScaleFactor: 2.7,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
                elevation: 20,
                child: new InkWell(
                  onLongPress: () => Tts.speak(Texts.plantDescription()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlantPage()),
                    );
                  },
                  child: Image.asset('assets/images/plantIcon.png'),
                )),
            SizedBox(
              height: 25,
            ),
            ButtonTheme(
              minWidth: 300,
              height: 90,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Crossword',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                onPressed:() => Tts.speak(Texts.crosswords()),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
              minWidth: 300,
              height: 90,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'AlphaDoku',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                onPressed: () => Tts.speak(Texts.alphadoku()),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
              minWidth: 300,
              height: 90,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Memory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                onPressed: () => Tts.speak(Texts.memory()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
