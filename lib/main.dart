import 'package:autismoapp/src/pages/imitate_page.dart';
import 'package:autismoapp/src/routes/route.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autismo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Principal #8EF27E RGB 142, 242, 126
        //Secundario #F27E8E RGB 242, 126, 142
        //Extra #95A2F4 RGB	149, 162, 244
        primarySwatch: Colors.lightGreen,
        secondaryHeaderColor: Color.fromRGBO(142, 242, 126, 1.0),
      ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>ImitatePage()
        );
      },
    );
  }
}
