import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _AnimationGoodProvider{
  
  List<dynamic> db=[];

  _AnimationGoodProvider();

  Future<List<dynamic>> loadData() async {
    final resp=await rootBundle.loadString('data/animation_good.json');

    Map dataMap=json.decode(resp);
    db=dataMap['data'];
    
    return db;
  }

}

final animationGoodProvider=new _AnimationGoodProvider();