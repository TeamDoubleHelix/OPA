import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(this.myIcon, this.myIconColour, this.buttonName, this.longTrue,
      this.callback);

  final VoidCallback callback;
  final bool longTrue;
  final IconData myIcon;
  final Color myIconColour;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: InkWell(
        onLongPress: longTrue ? callback : () {},
        onTap: !longTrue ? callback : () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              myIcon,
              size: 175,
              color: myIconColour,
            ),
            Text(
              buttonName,
              style: TextStyle( fontWeight: FontWeight.bold),
              textScaleFactor: 3.4,
            )
          ],
        ),
      ),
    );
  }
}
