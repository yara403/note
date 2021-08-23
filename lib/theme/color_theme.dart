import 'package:flutter/cupertino.dart';

abstract class ColorTheme {
  Color get text;
  Color get border;
}

class DefaultColorTheme implements ColorTheme {
  @override
  Color get text => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);
}
