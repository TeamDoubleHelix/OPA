import 'package:flutter/material.dart';
import './Friends.dart';

class Profile extends StatelessWidget{

  Person p;

  Profile(this.p);

  @override
  Widget build(BuildContext context){
    return Container(
      child:Center(
        child: Text(p.name),
      ),
    );
  }
}
