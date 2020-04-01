import 'package:flutter/material.dart';

final _icons=<String, IconData>{

  'voice'    : Icons.record_voice_over,
  'hearing'  : Icons.hearing,
  'widgets'  : Icons.widgets,
};  

Icon getIcon(String nameIcon){
  return Icon(_icons[nameIcon], color: Colors.lightGreen, size: 40.0,);
}