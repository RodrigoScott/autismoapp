import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _SoundProvider{
  
  List<dynamic> db=[];

  _SoundProvider();

  Future<List<dynamic>> loadData() async {
    final resp=await rootBundle.loadString('data/sound.json');

    Map dataMap=json.decode(resp);
    db=dataMap['data'];
    
    return db;
  }

}

final soundProvider=new _SoundProvider();