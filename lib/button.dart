import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(this.myIcon, this.myIconColour, this.buttonName, this.longTrue, this.callback);

final VoidCallback callback;
  final bool longTrue;
  final IconData myIcon;
  final Color myIconColour;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return InkWell(

         onLongPress:  longTrue ? callback : (){},
        onTap:   !longTrue ? callback : (){},
          child: Card(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(

              myIcon,
              size: 180,
              color: myIconColour,
            ),
            Text(

              buttonName,
              
              style: Theme.of(context).textTheme.body2,
              textScaleFactor: 3.5,
            )
          ],
        ),
      ),
    );
  }
}