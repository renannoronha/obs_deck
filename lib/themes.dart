import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  final light = ThemeData(
    primaryColor: Colors.blue[900],
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  final lightCupertino = CupertinoThemeData(
    primaryColor: const Color(0xFF1C306D),
    scaffoldBackgroundColor: CupertinoColors.white,
  );

  final dark = ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.blueGrey[900],
  );

  final darkCupertino = CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    scaffoldBackgroundColor: CupertinoColors.white,
  );
}
