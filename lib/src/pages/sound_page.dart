import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:autismoapp/src/providers/sound_provider.dart';

class SoundPage extends StatefulWidget {
  @override
  _SoundPageState createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {

  int _start=0;
  int _end=3;
  bool _isVisible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escucha el sonido diferente')
      ),
      body: _data(),
      floatingActionButton: Visibility( 
          visible: _isVisible,
          child: FloatingActionButton(
            child: Icon(Icons.navigate_next, color: Colors.white, size: 40.0),
            backgroundColor: Color.fromRGBO(242, 126, 142, 1.0),
            onPressed: () => _show(context)
          )
        ),
    );
  }

  Widget _data() {
    return FutureBuilder(
      future: soundProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        if(snapshot.hasData){
          return Padding(
          padding: EdgeInsets.only(top:60.0,left: 10.0),
          child: Column(
            children: _dataItems(snapshot.data)
          ),
        );
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              )
            );
        }
      },
    );
  }

  List<Widget> _dataItems( List<dynamic> db){
    final List<Widget> items=[];
    
    db.sublist(_start,_end).forEach((opt){
      final widgetTemp= _createButtons(opt['text'], opt['sound']);
      items..add(widgetTemp);
    }); 
    return items;
  }

  Widget _createButtons(String text, String sound){
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
                  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                ],
              ),
              onPressed: (){
                AudioCache player = AudioCache();
                player.play(sound);
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
                  Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,)),
                ],
              ),
              onPressed: (){},
            )
          ),
        ],
      )
    );
  }
  void _show(BuildContext context){
    setState(() {
      _start+=3;
      _end+=3;
      
      if(_end==95){
        _isVisible = !_isVisible;
      }
    });
  }
}