import 'dart:convert';
class Sound{
  int id;
  String title;
  String voice;

  Sound({
    this.id,
    this.title,
    this.voice
  });

  Sound.fromJson(String jsonList){
    List<Sound> sounds = [];

    final jsonResponse = json.decode('data/sound.json');
    //final sounds = new Sound.fromJson(jsonResponse);

    for(Sound sound in sounds){
      sounds.add(sound);
    }
    //return sounds;
  }
}