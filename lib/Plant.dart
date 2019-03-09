import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

class PlantPage extends StatefulWidget {
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  String currentImage = 'assets/images/wateringCan.png';
  String plantState = 'assets/images/plant1.png';
  int counter = 1;

  TextStyle style;
  //String initialState = 'assets/images/initial/';

  double _start;
  double pouringState;
  Timer _timer;
  @override

  void initState() {
    super.initState();

    style = new TextStyle(fontSize: 30);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Growing Plant',textScaleFactor: 2.1,),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                    transform: Matrix4.translationValues(60, 50, 0),
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Image.asset(plantState)),
            Transform(
                      transform: Matrix4.translationValues(-50, -140, 0),
                          child: new InkWell(
                
                child: Padding(
                  child: Container(
                      width: (MediaQuery.of(context).size.width - 40) / 2,
                      child: Image.asset(currentImage)),
                  padding: EdgeInsets.all(6),
                ),
                onTap: () {
                  _start = 2;
                  counter++;
                  pouringState = 0.0;

                  _timer = new Timer.periodic(
                      const Duration(milliseconds: 500),
                      (Timer timer) => setState(() {
                            if (_start < 0.5) {
                              _timer.cancel();
                              //print("timer finished");
                              //print("active ${_timer.isActive}");
                              //print("equal ${timer == _timer}");
                              currentImage = 'assets/images/wateringCan.png';
                              if(counter>6){
                                counter=1;
                              }
                              plantState = 'assets/images/plant${counter}.png';
                              

                              //todo: ending loop plants

                            } else {
                              //print("timer value $_start ${_timer.isActive}");
                              //print("equal ${timer == _timer}");
                              _start = _start - 0.5;
                              pouringState += 0.5;

                              // need the pattern 1,2,1,2
                              // pouringstate*2 % 2 +1
                              // 0.0        1
                              // 0.5        2
                              // 1.0        1
                              // 1.5        2
                              // 2.0        1

                              print("pouring state : $pouringState");
                              print(
                                  "image state : ${(((pouringState * 2) % 2) + 1)}");
                              int state = (((pouringState * 2) % 2) + 1).toInt();
                              currentImage = 'assets/images/pouring$state.png';
                            }
                          }));

                  setState(() {
                    currentImage = 'assets/images/pouring1.png';
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
