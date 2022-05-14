import 'package:flutter/material.dart';

class Palette {
  static final ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: transparent,
      iconTheme: IconThemeData(color: defaultColorDart),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.all(12),
      hintStyle: TextStyle(color: Palette.silver, fontSize: 13),
      border: OutlineInputBorder(borderSide: BorderSide(color: silver), borderRadius: const BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: silver), borderRadius: const BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: silver), borderRadius: const BorderRadius.all(Radius.circular(10))),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: red), borderRadius: const BorderRadius.all(Radius.circular(10))),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: red), borderRadius: const BorderRadius.all(Radius.circular(10))),
    ),
  );

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color defaultColorLight = Color.fromRGBO(17, 148, 235, 1);
  static const Color defaultColorDart = Color.fromRGBO(0, 103, 171, 1);
  static Color silver = const Color(0xff7B7B7B);
  static Color red = const Color(0xffEE4F34);
}
