import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:opa/EventViewer.dart';
import 'package:opa/Friends.dart';
=======
import 'package:opa/sosPage.dart';
>>>>>>> matt

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elderly',
      theme: ThemeData(
<<<<<<< HEAD
        primarySwatch: Colors.red,
=======
        primarySwatch: Colors.blue,
>>>>>>> matt
      ),
      home: MyHomePage(title: 'Elderly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

<<<<<<< HEAD

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Friends(),
    
=======
  void _incrementCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SOSPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
>>>>>>> matt
    );
      
  }
}