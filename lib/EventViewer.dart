import 'package:flutter/material.dart';
import './CoffeeTime.dart';
import './Events.dart';

class EventViewer extends StatefulWidget {
  @override
  _EventViewerState createState() => _EventViewerState();
}

class _EventViewerState extends State<EventViewer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar: AppBar(
            
             backgroundColor: Theme.of(context).accentColor,
            
            flexibleSpace: SafeArea(
            
            child: TabBar(
              unselectedLabelColor: Colors.black,            
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            
              tabs: [
                Tab(text: 'Events' ),
                Tab(text: 'Coffee Time')
              ],
            ),
          ),
          ),
        body:TabBarView(
          children:[
            Events(),
            CoffeeTime()
      ],
      ),
    ),);
  }
}