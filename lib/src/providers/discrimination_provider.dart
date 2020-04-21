import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _DiscriminationProvider{
  
  List<dynamic> db=[];

  _DiscriminationProvider();

  Future<List<dynamic>> loadData() async {
    final resp=await rootBundle.loadString('data/discrimination.json');

    Map dataMap=json.decode(resp);
    db=dataMap['data'];
    
    return db;
  }

}

final discriminationProvider=new _DiscriminationProvider();