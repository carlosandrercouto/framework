import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle bold39({bool screenUtilActive = true}) {
    return TextStyle(
        fontSize: (screenUtilActive) ? _adaptiveFontSize(fontSize: 39, fontSizeMax: 41, fontSizeMin: 37) : 39,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.3);
  }

  static TextStyle bold30() {
    return TextStyle(
      fontSize: _adaptiveFontSize(fontSize: 30, fontSizeMax: 32, fontSizeMin: 28),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold24() {
    return TextStyle(
      fontSize: _adaptiveFontSize(fontSize: 24, fontSizeMax: 26, fontSizeMin: 22),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold21() {
    return TextStyle(
      fontSize: _adaptiveFontSize(fontSize: 21, fontSizeMax: 23, fontSizeMin: 19),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold20() {
    return TextStyle(
      fontSize: _adaptiveFontSize(fontSize: 20, fontSizeMax: 22, fontSizeMin: 18),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold19() {
    return TextStyle(
      fontSize: _adaptiveFontSize(fontSize: 19, fontSizeMax: 21, fontSizeMin: 17),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold18() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 18, fontSizeMax: 20, fontSizeMin: 16),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold17() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 17, fontSizeMax: 19, fontSizeMin: 15),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold16() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 16, fontSizeMax: 18, fontSizeMin: 14),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold15() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 15, fontSizeMax: 17, fontSizeMin: 13),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold14({bool screenUtilActive = true}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: (screenUtilActive) ? _adaptiveFontSize(fontSize: 14, fontSizeMax: 16, fontSizeMin: 12) : 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold10() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 10, fontSizeMax: 12, fontSizeMin: 10),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold12() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 12, fontSizeMax: 14, fontSizeMin: 11),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle bold13() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 13, fontSizeMax: 15, fontSizeMin: 11),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }

  static TextStyle regular18() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 18, fontSizeMax: 20, fontSizeMin: 16),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle regular17() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 17, fontSizeMax: 17, fontSizeMin: 15),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle regular16() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 16, fontSizeMax: 18, fontSizeMin: 14),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle regular14() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 14, fontSizeMax: 16, fontSizeMin: 12),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle regular12({bool screenUtilActive = true}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: (screenUtilActive) ? _adaptiveFontSize(fontSize: 12, fontSizeMax: 14, fontSizeMin: 11) : 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle regular10({bool screenUtilActive = true}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: (screenUtilActive) ? _adaptiveFontSize(fontSize: 10, fontSizeMax: 12, fontSizeMin: 10) : 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.1,
    );
  }

  static TextStyle light17() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: _adaptiveFontSize(fontSize: 17, fontSizeMax: 19, fontSizeMin: 15),
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      height: 1.3,
    );
  }
}

_adaptiveFontSize({
  int fontSize,
  double fontSizeMax,
  double fontSizeMin,
}) {
  if (ScreenUtil().setSp(fontSize) > fontSizeMax) {
    return fontSizeMax;
  } else if (ScreenUtil().setSp(fontSize) < fontSizeMin) {
    return fontSizeMin;
  }
  return ScreenUtil().setSp(fontSize);
}
