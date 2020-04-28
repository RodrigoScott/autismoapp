import 'package:autismoapp/src/widgets/animation_good_item.dart';
import 'package:flutter/material.dart';
import 'package:autismoapp/src/providers/animation_good_provider.dart';

class AnimationGoodPage extends StatefulWidget {
  @override
  _AnimationGoodPageState createState() => _AnimationGoodPageState();
}

class _AnimationGoodPageState extends State<AnimationGoodPage> {

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
      _sound();
      final widgetTemp=AnimationGoodItem(
        image: opt['image'],
        sound: opt['sound'],
      );
      items..add(widgetTemp);
    });
    return items;
  }

  void _sound(){
    _start+=1;
    _end+=1;

    if(_end==11){
      _start=0;
      _end=1;
      print(_start);
      print(_end);
    }
  }

}