import 'package:flutter/material.dart';

class GradientColor {
  static const noMember = LinearGradient(
    colors: [
      Color(0xFF121A24),
      Color.fromARGB(255, 21, 29, 40),
      Color(0xFF24292F),
      Color(0xFF262c32),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  );

  static const silver = LinearGradient(
    colors: [
      Color(0xFFC5C5C5),
      Color.fromARGB(255, 54, 61, 69),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
  );

  static const gold = LinearGradient(
    colors: [
      Color(0xFFD09A00),
      Color(0xFFFFD285),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const platinum = LinearGradient(
    colors: [
      Color.fromARGB(255, 120, 120, 120),
      Color(0xFFA3A3A3),
      Color(0xFF9E9E9E),
      Color(0xFFDDDDDD),
      Color(0xFFB6B6B6),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
