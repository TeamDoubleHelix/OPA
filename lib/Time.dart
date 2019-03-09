import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TimeClass extends StatefulWidget {
  @override
  _TimeClassState createState() => _TimeClassState();
}

class _TimeClassState extends State<TimeClass> {
  DateFormat dateFormat;
  DateFormat timeFormat;

  Timer timer;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('cs');
    timeFormat = new DateFormat.Hm('cs');

    timer = new Timer.periodic(const Duration(seconds: 1), refresh);
  }

  void refresh(Timer a) {
    if(this.mounted)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();
    return Text(
      timeFormat.format(dateTime),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.body2,
      textScaleFactor: 5.0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
