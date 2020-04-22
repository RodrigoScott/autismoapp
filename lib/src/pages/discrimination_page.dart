import 'package:autismoapp/src/providers/discrimination_provider.dart';
import 'package:autismoapp/src/widgets/discrimination_item.dart';
import 'package:flutter/material.dart';

class DiscriminationPage extends StatefulWidget {
  @override
  _DiscriminationPageState createState() => _DiscriminationPageState();
}

class _DiscriminationPageState extends State<DiscriminationPage> {

  int _start=0;
  int _end=3;
  bool _visible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Discriminación de conjuntos')),
      body: _data(),
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
      future: discriminationProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        if(snapshot.hasData){
          return Padding(
          padding: EdgeInsets.only(top:60.0,left: 60.0),
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
      final widgetTemp= DiscriminationItem(
        id: opt['id'], 
        title: opt['title']
      );
      items..add(widgetTemp);
    }); 
    return items;
  }

  void _nextButton(BuildContext context){
    setState(() {
      _start+=3;
      _end+=3;
      
      if(_end==45){
        _visible = !_visible;
      }
    });
  }
}