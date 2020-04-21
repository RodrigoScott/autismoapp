import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:autismoapp/src/providers/animation_good_provider.dart';

class AnimationGoodPage extends StatefulWidget {
  @override
  _AnimationGoodPageState createState() => _AnimationGoodPageState();
}

class _AnimationGoodPageState extends State<AnimationGoodPage> {
  
  AudioCache _player = AudioCache();
  int _end=1;
  int _start=0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( ),
      body: _data()
    );
  }

  Widget _data() {
    return FutureBuilder(
      future: animationGoodProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _dataItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _dataItems( List<dynamic> db){
    final List<Widget> items=[];

    db..sublist(0,1).forEach((opt){
      final widgetTemp=_buildAnimation(opt['image'], opt['sound']);
      items..add(widgetTemp);
    });
    return items;
  }

  Widget _buildAnimation(String image, String sound){

    _player.play(sound);
    
    return ClipRect(
      child: Container(
        height: 530.0,
        width: 400.0,
        child: Container(
          child: Image.asset(image),
          height: 500.0,
          width: 350.0
        ),
      ),
    );
  }

  void _sound(String sound){
    setState(() {
      _start+=1;
      _end+=1;

      if(_end==11){
        _start=0;
        _end=1;
        print(_start);
        print(_end);
      }
    });
  }

  Widget streamSample(context, AsyncSnapshot<List<dynamic>> snapshot) {
    if (snapshot.hasData) {
      return Text("Success");
    } else {
      return Container();
    }
  }
}