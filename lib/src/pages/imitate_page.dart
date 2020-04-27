import 'dart:ui';
import 'package:autismoapp/src/providers/imitate_provider.dart';
import 'package:autismoapp/src/widgets/imitate_item.dart';
import 'package:flutter/material.dart';

class ImitatePage extends StatefulWidget {
  @override
  _ImitatePageState createState() => _ImitatePageState();
}

class _ImitatePageState extends State<ImitatePage> {

  int _start=0;
  int _end=4;
  bool _visible = true;

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
        alignment: Alignment(0.0, -0.5),
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
      final widgetTemp= ImitateItem(
        title: opt['title'],
        image: opt['image'],
        sound: opt['sound']
      );
      items..add(widgetTemp);
    });
    return items;
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