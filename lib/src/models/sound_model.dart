class Sound{
  String activity;
  List<dynamic> data;

  Sound({this.activity, this.data});

  factory Sound.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;
    List<dynamic> dataList = list.map((i) => Data.fromJson(i)).toList();

  return Sound(
    activity: parsedJson['activity'],
    data: parsedJson['data'],
  );
}

}
class Data{
  int id;
  String title;
  String voice;

  Data({this.id, this.title, this.voice});

  factory Data.fromJson(Map<String, dynamic> parsedJson){
    return Data(
      id:parsedJson['id'],
      title:parsedJson['title'],
      voice:parsedJson['sound']
    );
  }

  getTitle(){
    return title;
  }

  getVoice(){
    return voice;
  }
}