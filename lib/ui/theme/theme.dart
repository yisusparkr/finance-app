import 'package:flutter/material.dart';

const _primary    = Color(0xff0E62F6);
const _secondary   = Color(0xff1B439C);
const _background = Color(0xff0A0B1E);
const _white      = Color(0xffF1F3F5);

final theme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: _white,
    secondary: _secondary
  ),
  scaffoldBackgroundColor: _background,
  focusColor: _primary,
  splashColor: _primary,
  highlightColor: _secondary,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: _white,
    ),
    bodyText2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: _white,
    ),
    // Headline1 is used for textfields
    headline1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: _white,
    ),
    // Headline2 is used for buttons
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: _white
    )
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: _primary,
    selectionColor: _secondary,
    selectionHandleColor: _primary
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: _secondary,
        width: 1.5
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(
        color: _primary,
        width: 1.5
      ),
    )
  )
);