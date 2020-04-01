import 'package:flutter/material.dart';

class DiscriminationImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Discriminación de conjuntos')),
      body: Padding(
        padding: EdgeInsets.only(top:50.0,left: 10.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 5.0, // gap between adjacent chips
          runSpacing: 5.0, // gap between lines
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
        height: 170.0,
        width: 170.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
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
                height: 95.0,
              ),
              SizedBox(height: 5.0),
              Text(text, style: TextStyle(color: Colors.black, fontSize: 18.0)),
              SizedBox(height: 5.0),
            ],
          ),
          onPressed: (){},
        ),
      ),
    );
  }
}