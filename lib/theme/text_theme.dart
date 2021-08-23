import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class TextTheme {
  TextStyle get primary;
}

class DefaultTextTheme implements TextTheme {
  @override
  TextStyle get primary => GoogleFonts.inter(
        color: AppTheme.color.text,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
