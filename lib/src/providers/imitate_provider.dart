import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _ImitateProvider{
  
  List<dynamic> db=[];

  _ImitateProvider();

  Future<List<dynamic>> loadData() async {
    final resp=await rootBundle.loadString('data/imitate.json');

    Map dataMap=json.decode(resp);
    db=dataMap['data'];
    
    return db;
  }

}

final imitateProvider=new _ImitateProvider();