import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import 'WidgetOfTask.dart';

class DataWorker {
  static void writeJSON(String name, String date, String descr) {
    getApplicationDocumentsDirectory().then(
      (e) {
        File file = File("${e.path}/data.json");
        Map<String, dynamic> data = new Map<String, dynamic>();
        if (file.readAsStringSync().length != 0) data = jsonDecode(file.readAsStringSync());
        data[name] = {"date": date, "isChecked": "false", "description": ""};
        file.writeAsStringSync(jsonEncode(data));
      });
  }
  static Future<List<Widget>> getTasks() async {
    List<Widget> Tasks = new List<Widget>();
    Directory p = await getApplicationDocumentsDirectory();
    bool f = await File(p.path+"/data.json").exists();
    if (!f) File(p.path+"/data.json").writeAsStringSync("");
    Map<String, dynamic> data = jsonDecode(File("${p.path}/data.json").readAsStringSync());
    data.keys.forEach((e) {
      Tasks.add(WidgetOfTask(data[e]["isChecked"], e, data[e]["date"], data[e]["descr"]));
    });
    return Tasks;
  }
}