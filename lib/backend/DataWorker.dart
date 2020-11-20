import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import 'WidgetOfTask.dart';

class DataWorker {
  static void writeJSON(String name, String date, String descr) {
    getApplicationDocumentsDirectory().then(
      (e) {
        //File("${e.path}/data.json").writeAsStringSync("[]", mode:FileMode.write);
        File file = File("${e.path}/data.json");
        if (!file.existsSync()) file.writeAsStringSync("{}");
        Map<String, dynamic> data = new Map<String, dynamic>();
        if (file.readAsStringSync().length != 0) data = jsonDecode(file.readAsStringSync());
        data[name] = {"date": date, "isChecked": "false", "description": descr};
        file.writeAsStringSync(jsonEncode(data));
      });
  }
  static Future<List<Widget>> getTasks() async {
    
    List<Widget> Tasks = new List<Widget>();
    Directory p = await getApplicationDocumentsDirectory();
    //File("${p.path}/data.json").writeAsStringSync("{}", mode:FileMode.write);
    print(File("${p.path}/data.json").readAsStringSync());
    
    bool f = await File(p.path+"/data.json").exists();
    if (!f) File(p.path+"/data.json").writeAsStringSync("{}");
    Map<String, dynamic> data = jsonDecode(File("${p.path}/data.json").readAsStringSync());
    data.keys.forEach((e) {
      print(data[e]);
      Tasks.add(WidgetOfTask(name:e, time:data[e]["date"], discription:data[e]["description"]));
    });
    return Tasks;
  }
}