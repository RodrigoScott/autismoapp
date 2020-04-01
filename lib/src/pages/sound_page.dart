import 'package:flutter/material.dart';
import 'package:autismoapp/src/providers/sound_provider.dart';

class SoundPage extends StatefulWidget {
  @override
  _SoundPageState createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escucha el sonido diferente')
      ),
      body: _data(),
      floatingActionButton: Visibility( 
          //visible: _isVisible,
          child: FloatingActionButton(
            child: Icon(Icons.navigate_next, color: Colors.white, size: 40.0),
            backgroundColor: Color.fromRGBO(242, 126, 142, 1.0),
            onPressed: () => {}
          )
        ),
    );
  }

  Widget _data() {
    return FutureBuilder(
      future: soundProvider.loadData(),
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
    
    db.forEach((opt){
      
      final widgetTemp=Column(
        children: <Widget>[
          _createButtons(opt['text'], opt['sound']),
        ]
      );
      items..add(widgetTemp);

    }); 
    return items;
  }

  Widget _createButtons(String text, String sound){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
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
}