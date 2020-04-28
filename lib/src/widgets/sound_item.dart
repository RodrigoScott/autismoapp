import 'package:audioplayers/audio_cache.dart';
import 'package:autismoapp/src/models/sound_model.dart';
import 'package:flutter/material.dart';

class SoundItem extends StatefulWidget {

  /*final int id;
  final String title;
  final String voice;
  
  const SoundItem({this.id, this.title, this.voice});*/

  final List<Sound> sounds;

  SoundItem({this.sounds});

  @override
  _SoundItemState createState() => _SoundItemState();
}

class _SoundItemState extends State<SoundItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            child: FlatButton(
              color: Color.fromRGBO(149, 162, 244, .4),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.volume_up),
                  Text(sounds.getTitle(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                ],
              ),
              onPressed: (){
                AudioCache player = AudioCache();
                player.play(sounds.getVoice());
              },
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
                  Text(sounds.getTitle(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                ],
              ),
              onPressed: (){
                AudioCache player = AudioCache();
                player.play(sounds.getVoice());
              },
            )
          ),
        ],
      )
    );
  }
}