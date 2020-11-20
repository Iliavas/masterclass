import 'package:flutter/material.dart';

import 'DataWorker.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoad = false;
  List<Widget> Tasks = new List<Widget>();
  @override
  Widget build(BuildContext ctx) {
    DataWorker.writeJSON("Vasya", "16:30", "");
    DataWorker.writeJSON("sosi", "15:30", "");
    if (!isLoad) {
      DataWorker.getTasks().then((e) {
        setState(() {
          isLoad=true;
          Tasks = e;
          print(Tasks);
        });
      });
    }
    return Scaffold(
      body: ListView(
        children: Tasks
      )
    );
  }
}