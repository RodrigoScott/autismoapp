import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _DiscriminationImagesProvider{
  
  List<dynamic> db=[];

  _DiscriminationImagesProvider();

  Future<List<dynamic>> loadData() async {
    final resp=await rootBundle.loadString('data/discrimination_images.json');

    Map dataMap=json.decode(resp);
    db=dataMap['data'];
    
    return db;
  }

}

final discriminationImagesProvider=new _DiscriminationImagesProvider();