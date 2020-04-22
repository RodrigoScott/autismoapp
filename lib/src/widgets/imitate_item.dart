import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class ImitateItem extends StatefulWidget {

  final String title;
  final String image;
  final String sound;

  const ImitateItem({this.title, this.image, this.sound});

  @override
  _ImitateItemState createState() => _ImitateItemState();
}

class _ImitateItemState extends State<ImitateItem> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: 170.0,
        width: 145.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 5)
            ),
          ],
        ),
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Icon(Icons.volume_up),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right:1.0, top: 2.0),
              ),
              Container(
                child: Image.asset(this.widget.image),
                height: 100.0,
              ),
              SizedBox(height: 2.0),
              Text(this.widget.title, style: TextStyle(color: Colors.black)),
              SizedBox(height: 3.0),
            ],
          ),
          onPressed: (){
            AudioCache player = AudioCache();
            player.play(this.widget.sound);
          },
        ),
      ),
    );
  }
}