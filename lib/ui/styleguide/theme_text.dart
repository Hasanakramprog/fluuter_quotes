import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  static final headline = GoogleFonts.cairo(
    textStyle: _headline.copyWith(
      fontSize: ScreenUtil().setSp(16),
    ),
  );
  static final subhead = GoogleFonts.cairo(
    textStyle: _subHead.copyWith(
      fontSize: ScreenUtil().setSp(12),
    ),
  );
  static const _headline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  static const _subHead = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
}
