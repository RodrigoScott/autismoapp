import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async' show Future;
import 'package:autismoapp/src/models/sound_model.dart';

class _SoundProvider{
  
  List<dynamic> db=[];

  _SoundProvider();

  Future<List<Sound>> loadData() async {

    final jsonString=await rootBundle.loadString('data/sound.json');
    final jsonResponse = json.decode(jsonString);
    final sound = new Sound.fromJson(jsonResponse);
    print(sound.id);

    return [];
  }

}

final soundProvider=new _SoundProvider();