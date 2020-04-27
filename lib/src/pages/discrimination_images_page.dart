import 'package:autismoapp/src/providers/discrimination_images_provider.dart';
import 'package:autismoapp/src/widgets/discrimination_image_item.dart';
import 'package:flutter/material.dart';

class DiscriminationImagesPage extends StatefulWidget {
  @override
  _DiscriminationImagesPageState createState() => _DiscriminationImagesPageState();
}

class _DiscriminationImagesPageState extends State<DiscriminationImagesPage> {

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
      future: discriminationImagesProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return Container(
          alignment: Alignment(0.0, -0.5),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 5.0, // gap between adjacent chips
            runSpacing: 10.0, // gap between lines
            children:  _dataItems(snapshot.data)
          )
        );
      }
    );
  }

  List<Widget> _dataItems( List<dynamic> db){
    final List<Widget> items=[];
    
    db.sublist(_start,_end).forEach((opt){
      final widgetTemp = DiscriminationImageItem(
        id: opt['id'],
        image: Image.asset(opt['image']), 
        title: opt['title']
      );
      items..add(widgetTemp);
    });
    return items;
    
  }

  void _nextButton(BuildContext context){
    setState(() {
      //Navigator.pushNamed(context, 'animationGood');
      
      _start+=3;
      _end+=3;
      
      if(_end==45){
        _visible = !_visible;
      }
    });
  }

}