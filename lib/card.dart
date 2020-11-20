import 'package:flutter/material.dart';

// void main(){
//   runApp(
//     MaterialApp(
//       title: "fff",
//       home: Scaffold(
//           body:Center(
//             child:ListView(
//               padding:EdgeInsets.symmetric(horizontal: 24.0,vertical: 100) ,
//               children:[Card("Сказать, что я дебил ", "16:10", "ТЫ")]
//               )
//         )
//       )
//     )
//   );
// }



class MyCard extends StatefulWidget{

    
  final String name;
  final String time;
  final String discription;

  MyCard(this.name, this.time, this.discription);

  @override
  _Card createState() => _Card();
}

class _Card extends State<MyCard>{
  
  bool comleted = false;
  Image image = Image.asset("assets/rect.png");
  Icon eleps = Icon(Icons.circle, color: Colors.blue[300],);

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
        title: Text(widget.name),
        subtitle: Row(
          children: [
            eleps,
            Text(widget.time),
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
                  title: Text(widget.name),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(widget.discription),
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