import 'package:flutter/material.dart';
import 'backend/DataWorker.dart';

import 'package:master_class/card.dart';
import 'main.dart';

class InputTemplate extends StatefulWidget{
  @override
  _InputTemplate createState() => _InputTemplate();
}
class _InputTemplate extends State<InputTemplate>{
  final myControllerDate = TextEditingController();
  final myControllerName = TextEditingController();
  final myControllerDescr = TextEditingController();
  
  Widget TimePicker = Text("Введите время", textAlign: TextAlign.left);

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text("Новая запись", style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0x323232)      
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            GestureDetector(
              child: TimePicker,
              onTap: () => showTimePicker(context: context, initialTime: TimeOfDay.now()).then((e) {setState(() {TimePicker = Text(e.format(context));});})
              ),
            TextField(
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Введите имя"
              ),
              controller: myControllerName,
            ),
            TextField(
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Введите описание",
                hintMaxLines: 5
              ),
              controller: myControllerDescr,
            ),
        
          FlatButton(
            child: Text("Далее", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            onPressed: (){
               DataWorker.writeJSON(myControllerDate.text, myControllerName.text, myControllerDescr.text);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TasksTemplate()) ,
              );
            },
          )
        ]
      )
    );
  }
}

main () => runApp(MaterialApp(home:InputTemplate()));
