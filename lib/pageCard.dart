
import 'package:flutter/material.dart';
import 'EventCard.dart';

abstract class PageCard extends StatelessWidget {

  @required
  Widget buildInternal(BuildContext context);

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.grey[300],
      elevation: 4.0,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildInternal(context),
      ),
    );
  }

}
