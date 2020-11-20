import 'package:flutter/material.dart';

class WidgetOfTask extends StatefulWidget{

    
  String name;
  String time;
  String discription;

  WidgetOfTask({this.name, this.time, this.discription});

  @override
  _Card createState() => _Card(name:name, time:time, descr:discription); 
}

class _Card extends State<WidgetOfTask>{
  
  bool comleted = false;
  Image image = Image.asset("assets/rect.png");
  Icon eleps = Icon(Icons.circle, color: Colors.blue[300],);

  String name, time, descr;

  _Card({this.name, this.time, this.descr});

  void elepse(){
    setState(() {
      if(this.comleted == false){
        this.eleps = Icon(Icons.circle, color: Colors.blue[300],);
      }
      else{
        this.eleps = Icon(Icons.circle, color: Colors.green[300],);
      }
    
    });
  }

  Image imageSelector(){
    setState(() {
      if(this.comleted == false){
        this.image = Image.asset("assets/rect.png");
      }
      else{
        this.image  = Image.asset("assets/check-mark.png");
      }
    });
  }

  Widget build(BuildContext context){

    ListTile myList = ListTile(
        leading: Container(child: this.image),
        title: Text(this.name),
        subtitle: Row(
          children: [
            eleps,
            Text(this.time),
          ],
        ),
        onLongPress: (){
          setState(() {
            this.comleted = !this.comleted;
            elepse();
            imageSelector();
          });
        },
        onTap: (){
          setState(() {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(this.name),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(this.descr),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('ОК'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });
        },
      );
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), 
          border: Border.all(
            color: Color(0xffe3e3e3), 
            width: 1,
            ),
          ),
        child: myList
    );
  }
}