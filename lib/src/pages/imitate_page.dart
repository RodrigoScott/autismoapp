import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:autismoapp/src/providers/imitate_provider.dart';
import 'package:flutter/material.dart';

class ImitatePage extends StatefulWidget {
  @override
  _ImitatePageState createState() => _ImitatePageState();
}

class _ImitatePageState extends State<ImitatePage> {

  int _start=0;
  int _end=4;
  bool _visible = true;
  AudioCache player = AudioCache();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imita el sonido')
      ),
      body:_data(),
      floatingActionButton: Visibility( 
        visible: _visible,
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next, color: Colors.white, size: 40.0),
          backgroundColor: Color.fromRGBO(242, 126, 142, 1.0),
          onPressed: () => _nextButton(context)
        )
      ),
    );
  }

  Widget _data() {
    return FutureBuilder(
      future: imitateProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return Container(
        padding: EdgeInsets.only(top:60.0,left: 10.0, right: 15.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 3.0, // gap between adjacent chips
          runSpacing: 3.0, // gap between lines
          children: _dataItems(snapshot.data),
        )
      );
      },
    );
  }

  List<Widget> _dataItems( List<dynamic> db){
    final List<Widget> items=[];

    db.sublist(_start,_end).forEach((opt){
      final widgetTemp=_build(opt['title'], opt['image'], opt['sound']);
      items..add(widgetTemp);
    });
    return items;
  }

  Widget _build(String title, String image, String sound){
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
                child: Image.asset(image),
                height: 100.0,
              ),
              SizedBox(height: 2.0),
              Text(title, style: TextStyle(color: Colors.black)),
              SizedBox(height: 3.0),
            ],
          ),
          onPressed: (){
            player.play(sound);
          },
        ),
      ),
    );
  }

  void _nextButton(BuildContext context){
    setState(() {
      _start+=4;
      _end+=4;
      
      if(_end==36){
        _visible = !_visible;
      }
    });
  }
}