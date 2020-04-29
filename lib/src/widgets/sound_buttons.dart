import 'package:flutter/material.dart';

class SoundButton extends StatefulWidget {
  @override
  _SoundButtonState createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => setState(() => _value = 0),
          child: Container(
            height: 35,
            width: 35,
            color: _value == 0 ? Colors.green : Colors.transparent,
            child: Icon(Icons.check),
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () => setState(() => _value = 1),
          child: Container(
            height: 35,
            width: 35,
            color: _value == 1 ? Colors.red : Colors.transparent,
            child: Icon(Icons.clear),
          ),
        ),
      ],
    );
  }
}