import 'package:flutter/material.dart';
import 'backend/DataWorker.dart';
import 'backend/WidgetOfTask.dart';
import 'InputTemplate.dart';

class TasksTemplate extends StatefulWidget{
  @override
  _TasksTemplate createState()=> _TasksTemplate();
}

class _TasksTemplate extends State<TasksTemplate>{
  bool isLoad = false;

  List<Widget> WidgetList = new List<Widget>();

  void getTasks(){
      if (!isLoad) {
        DataWorker.getTasks().then((e) {
          setState(() {
            isLoad=true;
            WidgetList = e;
            print(WidgetList);
            print("проверка");
          });
        });
      }
    }

  Widget build(BuildContext context){    
    
    //List<Widget> listOfWidgets = new List<Widget>();

    
    //listOfStrings.add(MyCard("gsdd","dmsds", "dssdsd"));
      if (!isLoad)
        getTasks();
      ListView myListView = ListView(children:WidgetList,);

      WidgetList.add(
      OutlineButton(
                onPressed: (){
                  setState(() {
                    isLoad = false;
                    //getTasks();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InputTemplate()));
                  });
                },
                child: Text("Добавить")
            )
          );

      return Scaffold(
        appBar: AppBar(
          title: Text("Список дел", style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0x323232),
        ),
        body: myListView


      );
    }
}

main () => runApp(MaterialApp(home:TasksTemplate()));
