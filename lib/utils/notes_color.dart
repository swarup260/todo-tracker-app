import 'package:flutter/material.dart';

class NotesColor {
  // ignore: unused_element
  NotesColor._();

  static const int _primaryValue = 0xFF5959D8;

  static const MaterialColor noteColor =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFC599C2),
    100: Color(0xFF636388),
    200: Color(0xFFC599C2),
    300: Color(_primaryValue),
    400: Color(0xFF7C7C8C),
    500: Color(0xFF55516C),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
  });

}
