import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscriminationItem extends StatefulWidget {

  final int id;
  final String title;
  
  const DiscriminationItem({this.id, this.title});

  @override
  _DiscriminationItemState createState() => _DiscriminationItemState();
}

class _DiscriminationItemState extends State<DiscriminationItem> {

  Color _color = Color.fromRGBO(149, 162, 244,0.7);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        key: ObjectKey(this.widget.id),
        height: 60.0,
        width: 180.0,
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3)
            ),
          ],
        ),
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(this.widget.title, style: TextStyle(color: Colors.black, fontSize: 22.0)),
              SizedBox(height: 5.0),
            ],
          ),
          onPressed: (){
            setState(() {
              _color=Color.fromRGBO(242, 126, 142, 0.7);
            });
          },
        ),
      ),
    );
  }
}