import 'package:flutter/material.dart';

class CustomColors {
  static ColorScheme get light {
    return const ColorScheme.light(
      primary: primary,
      secondary: secondary,
    );
  }

  static ColorScheme get dark {
    return const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
    );
  }

  static const Color primary = Color(0xFF73BAD1);
  static const Color secondary = Color(0xFFFAF5F3);
  static const Color beige = Color(0xFFE4DACB);
  static const Color black = Color(0xFF222021);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9BADB3);
  static const Color success = Color(0xFF469660);
  static const Color error = Color(0xFFD35340);
  static const Color transparent = Colors.transparent;
  static const Color darkGrey = Color(0xFF4A5356);
}
