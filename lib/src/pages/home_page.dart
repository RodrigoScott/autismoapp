import 'package:flutter/material.dart';
import 'package:autismoapp/src/providers/menu_provider.dart';
import 'package:autismoapp/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {

    /*MediaQueryData deviceInfo = MediaQuery.of(context);
    print('size: ${deviceInfo.size}');
    print('padding: ${deviceInfo.padding}');
    print('orientation: ${deviceInfo.orientation}');*/

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context){
    final List<Widget> options=[];

    data.forEach((opt){
      
      final widgetTemp=ListTile(
        title: Text(opt['title']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.lightGreen),
        onTap: (){
          Navigator.pushNamed(context, opt['route']);

          if (opt['route']=='discrimination'){
            _showAlert(context);
          }
        },
      );

      options..add(widgetTemp)
              ..add(Divider());

    }); 
    return options;
  }

  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(242, 126, 142, 1.0),
                    child: Icon(Icons.clear, color: Colors.white, size: 20.0),
                    onPressed: () => Navigator.of(context).pop()
                  )
                )
              ),
              SizedBox(height:5.0),
              Text('Selecciona cómo se llevará a cabo la siguiente actividad:',style: TextStyle(fontSize:18.0, color:Colors.black),)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Con apoyo visual', style: TextStyle(fontSize:18.0, color:Colors.black87)),
                  Icon(Icons.arrow_forward, color: Colors.black87)
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, 'discriminationImages')
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Sin apoyo visual', style: TextStyle(fontSize:18.0, color:Colors.black87)),
                  Icon(Icons.arrow_forward, color: Colors.black87)
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, 'discrimination')
            ),
            SizedBox(height:5.0)
          ],
        );
      }
    );
  }

}