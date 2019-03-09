import 'package:flutter/material.dart';
import 'package:tts/tts.dart';

class MyButton extends StatelessWidget {
  MyButton(this.myIcon, this.myIconImage, this.myIconColour, this.buttonName,
      this.longTrue, this.callback, this.descriptionString);

  final ImageIcon myIconImage;
  final VoidCallback callback;
  final bool longTrue;
  final IconData myIcon;
  final Color myIconColour;
  final String buttonName, descriptionString;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: InkWell(
        onLongPress: () {
          if (longTrue)
            callback();
          else
            Tts.speak(descriptionString);
        },
        onTap: () {
          if (!longTrue)
            callback();
          else
            Tts.speak(descriptionString);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReturnImage(myIcon, myIconImage, myIconColour),
            Text(
              buttonName,
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 3.4,
            )
          ],
        ),
      ),
    );
  }
}

class ReturnImage extends StatelessWidget {
  ReturnImage(this.myIcon, this.myIconImage, this.myIconColour);

  final ImageIcon myIconImage;
  final IconData myIcon;
  final Color myIconColour;

  @override
  Widget build(BuildContext context) {
      if (myIconImage == null) {
        return  Icon(
              myIcon,
              size: 175,
              color: myIconColour,
            );
  }
  else{
    return myIconImage;
  }
  }

}
