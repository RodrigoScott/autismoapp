import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class AnimationGoodItem extends StatefulWidget {

  final String image;
  final String sound;
  final int start;
  final int end;

  const AnimationGoodItem({this.image, this.sound, this.start, this.end});

  @override
  _AnimationGoodItemState createState() => _AnimationGoodItemState();
}

class _AnimationGoodItemState extends State<AnimationGoodItem> {

  AudioCache _player = AudioCache();
  
  @override
  Widget build(BuildContext context) {
    _player.play(this.widget.sound);
    return ClipRect(
      child: Container(
        height: 530.0,
        width: 400.0,
        child: Container(
          child: Image.asset(this.widget.image),
          height: 500.0,
          width: 350.0
        ),
      ),
    );
  }

}