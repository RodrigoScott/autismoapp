import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async' show Future;
import 'package:autismoapp/src/models/sound_model.dart';

class SoundProvider {
  List<dynamic> db = [];

  SoundProvider();

  Future<List<Sound>> loadData() async {
    final jsonString = await rootBundle.loadString('data/sound.json');
    final jsonResponse = json.decode(jsonString);
    final sounds = new Sounds.fromJson(jsonResponse).sounds;
    return sounds;
  }
}

final soundProvider = new SoundProvider();
