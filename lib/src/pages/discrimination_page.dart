import 'package:flutter/material.dart';

class DiscriminationPage extends StatefulWidget {
  @override
  _DiscriminationPageState createState() => _DiscriminationPageState();
}

class _DiscriminationPageState extends State<DiscriminationPage> {

  Color _color=Color.fromRGBO(149, 162, 244,0.7);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Discriminación de conjuntos')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 60.0),
            _buildContainer('Arcoiris'),
            _buildContainer('Automóvil'),
            _buildContainer('Bicicleta'),
          ],
        ),
      ),
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

  Widget _buildContainer(String text) {
    return ClipRect(
      child: Container(
        height: 60.0,
        width: 180.0,
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3)
            ),
          ],
        ),
        child: FlatButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(text, style: TextStyle(color: Colors.black, fontSize: 22.0)),
              SizedBox(height: 5.0),
            ],
          ),
          onPressed: (){
            setState(() {
              _color=Color.fromRGBO(242, 126, 142, 0.7);
            });
          },
        ),
      ),
    );
  }
}