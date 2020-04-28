import 'package:flutter/material.dart';

class PruebaSound extends StatefulWidget {
  @override
  _PruebaSoundState createState() => _PruebaSoundState();
}

class _PruebaSoundState extends State<PruebaSound> {

  List<bool> isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: FlatButton(
                color: Color.fromRGBO(149, 162, 244, .4),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.volume_up),
                    Text('Hola', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                  ],
                ),
                onPressed: (){},
              )
            ),
            Spacer(flex: 2),
            ClipOval(
              child: Material(
                color: Colors.green, 
                child: InkWell(
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.check, color: Colors.white)
                  ),
                  onTap: () {},
                )
              ),
            ),
            Spacer(),
            ClipOval(
              child: Material(
                color: Colors.red, 
                child: InkWell(
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.clear, color: Colors.white)
                  ),
                  onTap: () {},
                )
              ),
            ),
            Spacer(flex: 2),
            Container(
              child: FlatButton(
                color: Color.fromRGBO(149, 162, 244, .4),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.volume_up),
                    Text('Hola', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                  ],
                ),
                onPressed: (){},
              )
            ),
            ToggleButtons(
              borderRadius: BorderRadius.circular(10.0),
              color:Colors.black,
              selectedColor: Colors.green,
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.green, 
                    child: InkWell(
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Icon(Icons.check, color: Colors.white)
                      ),
                      onTap: () {},
                    )
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.clear, color: Colors.red)
                  ),
                )
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
          ],
        )
      )
    );
  }
}