class Sounds {
  String activity;
  List<Sound> sounds;

  Sounds({this.activity, this.sounds});

  factory Sounds.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Sound> sounds = list.map((i) => Sound.fromJson(i)).toList();

    return Sounds(
      activity: parsedJson['activity'],
      sounds: sounds,
    );
  }
}

class Sound {
  int id;
  String title;
  String voice;

  Sound({this.id, this.title, this.voice});

  factory Sound.fromJson(Map<String, dynamic> parsedJson) {
    return Sound(
        id: parsedJson['id'],
        title: parsedJson['title'],
        voice: parsedJson['sound']);
  }

  getTitle() {
    return title;
  }

  getVoice() {
    return voice;
  }
}
