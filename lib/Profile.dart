import 'package:flutter/material.dart';
import './Friends.dart';

class Profile extends StatelessWidget{

  final Person p;

  Profile(this.p);

  @override
  Widget build(BuildContext context){
    
    return Card(
    
      child: Container(
        height: 90,
        
        child:Center(
          child:Row(
          children: <Widget>[
            
            Icon(Icons.person, size: 70,),
          
            Text(" "+p.name+" ", textScaleFactor: 5,),
            IconButton(
              icon: Icon(Icons.call,size: 60,),
              onPressed: (){
                print('hey');
              }
            )
          ],
        )
        )
        
      )
      
    );
  }
}
