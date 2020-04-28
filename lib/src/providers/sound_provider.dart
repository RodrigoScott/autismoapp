import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async' show Future;
import 'package:autismoapp/src/models/sound_model.dart';

class SoundProvider{
  
  List<dynamic> db=[];

  SoundProvider();

  Future<List<Sound>> loadData() async {

    final jsonString=await rootBundle.loadString('data/sound.json');
    final jsonResponse = json.decode(jsonString);
    final sound = new Sound.fromJson(jsonResponse);
    //print(sound.data[0]);

    return sound.data;
  }

}

final soundProvider=new SoundProvider();