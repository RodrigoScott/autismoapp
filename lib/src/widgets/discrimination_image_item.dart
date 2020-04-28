import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscriminationImageItem extends StatefulWidget {

  final int id;
  final Image image;
  final String title;
  final String category;
  
  const DiscriminationImageItem({this.id, this.image, this.title, this.category});

  @override
  _DiscriminationImageItemState createState() {
    return _DiscriminationImageItemState();
  }
}


class _DiscriminationImageItemState extends State<DiscriminationImageItem> {

  Color _colorBorder = Colors.transparent;
  double _widthBorder = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        key: ObjectKey(this.widget.id),
        height: 180.0,
        width: 150.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: this._colorBorder,
            width: this._widthBorder,
          ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: this.widget.image,
                height: 120.0,
              ),
              SizedBox(height: 5.0),
              Text(this.widget.title, style: TextStyle(color: Colors.black, fontSize: 18.0)),
              SizedBox(height: 5.0),
            ],
          ),
          onPressed: (){
            print(this.widget.id);
            setState(() {
                _colorBorder = Color.fromRGBO(149, 162, 244,1.0);
                _widthBorder=7.0;
            });
          },
        ),
      ),
    );
  }

  void _review(){
    if(this.widget.id==this.widget.id){

    }
  }

}