import 'package:flutter/material.dart';

class DiscriminationImagesPage extends StatefulWidget {
  @override
  _DiscriminationImagesPageState createState() => _DiscriminationImagesPageState();
}

class _DiscriminationImagesPageState extends State<DiscriminationImagesPage> {

  Color _colorBorder=Colors.transparent;
  double _widthBorder=0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Discriminación de conjuntos')),
      body: Padding(
        padding: EdgeInsets.only(top:60.0,left: 20.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 5.0, // gap between adjacent chips
          runSpacing: 10.0, // gap between lines
          children: <Widget>[
            _buildContainer('assets/img/discrimination/arcoiris.png','Arcoiris'),
            _buildContainer('assets/img/discrimination/automovil.jpg','Automóvil'),
            _buildContainer('assets/img/discrimination/bicicleta.jpg','Bicicleta'),
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

  Widget _buildContainer(String image, String text) {
    return ClipRect(
      child: Container(
        height: 180.0,
        width: 150.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: _colorBorder,
            width: _widthBorder,
          ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image.asset(image),
                height: 120.0,
              ),
              SizedBox(height: 5.0),
              Text(text, style: TextStyle(color: Colors.black, fontSize: 18.0)),
              SizedBox(height: 5.0),
            ],
          ),
          onPressed: (){
            setState(() {
              _colorBorder=Color.fromRGBO(149, 162, 244,1.0);
              _widthBorder=7.0;
            });
          },
        ),
      ),
    );
  }
}