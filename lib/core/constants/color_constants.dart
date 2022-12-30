import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6357CC);
  static const Color secondaryColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);
  static const Color dividerColor = Color(0xffE5E5E5);
  static const Color primaryTextColor = Color(0xff313131);
  static const Color subTitleColor = Color(0xff636363);
  static const Color purpleTextColor = Color(0xff6155CC);
  static const Color scaffoldBackgroundColor = Color(0xffF0F2F6);
}

class Gradients {
  static const Gradient defaultGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [ColorPalette.secondaryColor, ColorPalette.primaryColor],
  );
}
