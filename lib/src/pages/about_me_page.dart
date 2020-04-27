import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de')
      ),
      body: Container(
        padding: EdgeInsets.all(60.0),
        child: Column(
          children: <Widget>[
            Expanded( 
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[ 
                  Text(
                    'Es una app creada con mucho cariño y dedicación para apoyar a los niños con autismo en la terapia del lenguaje, desarrollada por:',
                    maxLines: 5,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 60.0),
                  Text(
                    'Karla Ruan',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'kyesenia.18@gmail.com',
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                  ),
                ]
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/uaalogo.png'),
                    ),
                  )
                ),
                Container(
                  width: 50,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/logo-cotii-rosa.png'),
                    ),
                  )
                ),
              ]
            )
          ]
        )
      ),
    );
  }
}