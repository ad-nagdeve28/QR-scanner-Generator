import 'package:flutter/material.dart';

Widget Button_Widget(_colors, icon, Press){
  return FlatButton(
    shape: CircleBorder(),
    color: _colors,
    child: icon,
    onPressed: Press
  );
}

