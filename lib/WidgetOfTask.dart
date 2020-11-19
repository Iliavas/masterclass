import 'package:flutter/material.dart';

class WidgetOfTask extends StatelessWidget {
  String name, date, isChecked, descr;
  WidgetOfTask(String isChecked, String name, String date, String descr) {
    this.name = name;
    this.isChecked = isChecked;
    this.date = date;
    this.descr = descr;
  }
  @override
  Widget build(BuildContext ctx) {
    return Container(child: Text(this.name));
  }
}