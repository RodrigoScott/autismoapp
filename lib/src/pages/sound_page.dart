import 'package:flutter/material.dart';
import 'package:autismoapp/src/widgets/sound_item.dart';
import 'package:autismoapp/src/providers/sound_provider.dart';

class SoundPage extends StatefulWidget {
  final soundProvider = new SoundProvider();

  @override
  _SoundPageState createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  int _start = 0;
  int _end = 3;
  bool _visible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escucha el sonido diferente')),
      body: _data(),
      floatingActionButton: Visibility(
          visible: _visible,
          child: FloatingActionButton(
              child: Icon(Icons.navigate_next, color: Colors.white, size: 40.0),
              backgroundColor: Color.fromRGBO(242, 126, 142, 1.0),
              onPressed: () => _nextButton(context))),
    );
  }

  Widget _data() {
    return FutureBuilder(
      future: soundProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return Container(
              alignment: Alignment(0.0, 0.0),
              padding: EdgeInsets.only(top: 50.0),
              child: SoundItem(
                sounds: snapshot.data,
              ));
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  /*Widget _data() {
    return FutureBuilder(
      future: soundProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        if(snapshot.hasData){
          return Container(
          alignment: Alignment(0.0, 0.0),
          padding: EdgeInsets.only(top:50.0),
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
    
    db.forEach((opt){
      final widgetTemp= SoundItem(
        id: opt['id'], 
        title: opt['title'], 
        voice: opt['voice']
      );
      items..add(widgetTemp);
    }); 
    return items;
  }*/

  void _nextButton(BuildContext context) {
    setState(() {
      _start += 3;
      _end += 3;

      if (_end == 95) {
        _visible = !_visible;
      }
    });
  }
}
