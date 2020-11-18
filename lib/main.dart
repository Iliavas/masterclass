import 'dart:convert';

import "package:flutter/material.dart";

import 'package:path_provider/path_provider.dart';

import 'dart:io';

class MyWidget extends StatelessWidget {
  String name, date, isChecked;
  MyWidget(String isChecked, String name, String date) {
    this.name = name;
    this.isChecked = isChecked;
    this.date = date;
  }
  @override
  Widget build(BuildContext ctx) {
    return Container(child: Text(this.name));
  }
}

class DataWorker {
  static void writeJSON(String name, String date) {
    getApplicationDocumentsDirectory().then(
      (e) {
        File file = File("${e.path}/data.json");
        Map<String, dynamic> data = new Map<String, dynamic>();
        if (file.readAsStringSync().length != 0) data = jsonDecode(file.readAsStringSync());
        data[name] = {"date": date, "isChecked": "false"};
        file.writeAsStringSync(jsonEncode(data));
      });
  }
  static Future<List<Widget>> getTasks() async {
    List<Widget> Tasks = new List<Widget>();
    Directory p = await getApplicationDocumentsDirectory();
    Map<String, dynamic> data = jsonDecode(File("${p.path}/data.json").readAsStringSync());
    data.keys.forEach((e) {
      Tasks.add(MyWidget(data[e]["isChecked"], e, data[e]["date"]));
    });
    return Tasks;
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLoad = false;
  List<Widget> Tasks = new List<Widget>();
  @override
  Widget build(BuildContext ctx) {
    DataWorker.writeJSON("Vasya", "16:30");
    DataWorker.writeJSON("sosi", "15:30");
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



main () => runApp(MaterialApp(home:App()));