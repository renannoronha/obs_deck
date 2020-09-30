import 'dart:io';

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
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      counterStyle: TextStyle(color: Colors.white),
    ),
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    buttonColor: Colors.white,
  );

  final darkCupertino = CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    scaffoldBackgroundColor: CupertinoColors.white,
  );

  dynamic getThemeData(String theme) {
    try {
      if (theme == 'Light') {
        return  Platform.isAndroid ? Themes().light : Themes().lightCupertino;
      } else if (theme == 'Dark') {
        return  Platform.isAndroid ? Themes().dark : Themes().darkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return  Themes().light;
      } else if (theme == 'Dark') {
        return  Themes().dark;
      }
    }
  }

  

  final List<BoxShadow> activeShadowLight = [
    BoxShadow(color: Colors.grey[400], offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 200, 1), offset: Offset(-1.0, -1.0), blurRadius: 4.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadowLight = [
    BoxShadow(color: Colors.grey[600], offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: Colors.white, offset: Offset(-1.0, -1.0), blurRadius: 4.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButtonLight = [
    Color.fromRGBO(255, 255, 210, 0),
    Color.fromRGBO(255, 251, 230, 0),
  ];
  final List<Color> inactiveButtonLight = [
    Colors.grey[50],
    Colors.grey[50],
  ];

  final List<BoxShadow> activeShadowDark = [
    BoxShadow(color: Colors.grey[400], offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 200, 1), offset: Offset(-1.0, -1.0), blurRadius: 4.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadowDark = [
    BoxShadow(color: Colors.grey[600], offset: Offset(1.0, 1.0), blurRadius: 5.0, spreadRadius: 1.0),
    BoxShadow(color: Colors.grey[800], offset: Offset(-1.0, -1.0), blurRadius: 4.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButtonDark = [
    Color.fromRGBO(255, 255, 210, 0),
    Color.fromRGBO(255, 251, 230, 0),
  ];
  final List<Color> inactiveButtonDark = [
    Colors.grey,
    Colors.grey,
  ];



  
  final List<BoxShadow> activeShadowLightCupertino = [
    BoxShadow(color: CupertinoColors.systemGrey4, offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 200, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadowLightCupertino = [
    BoxShadow(color: CupertinoColors.systemGrey4, offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: CupertinoColors.systemGrey5, offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButtonLightCupertino = [
    Color.fromRGBO(255, 255, 210, 1),
    Color.fromRGBO(255, 251, 230, 1),
  ];
  final List<Color> inactiveButtonLightCupertino = [
    CupertinoColors.systemGrey5,
    CupertinoColors.systemGrey6,
  ];




  dynamic getActiveShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? activeShadowLight : this.activeShadowLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.activeShadowDark : null;
        // return Platform.isAndroid ? this.activeShadowDark : this.activeShadowDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Themes().activeShadowLight;
      } else if (theme == 'Dark') {
        return Themes().activeShadowDark;
      }
    }
  }

  dynamic getInactiveShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? inactiveShadowLight : this.inactiveShadowLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.inactiveShadowDark : null;
        // return Platform.isAndroid ? this.inactiveShadowDark : this.inactiveShadowDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Themes().inactiveShadowLight;
      } else if (theme == 'Dark') {
        return Themes().inactiveShadowDark;
      }
    }
  }

  dynamic getActiveButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? activeButtonLight : this.activeButtonLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.activeButtonDark : null;
        // return Platform.isAndroid ? this.activeButtonDark : this.activeButtonDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Themes().activeButtonLight;
      } else if (theme == 'Dark') {
        return Themes().activeButtonDark;
      }
    }
  }

  dynamic getInactiveButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? inactiveButtonLight : this.inactiveButtonLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.inactiveButtonDark : null;
        // return Platform.isAndroid ? this.inactiveButtonDark : this.inactiveButtonDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Themes().inactiveButtonLight;
      } else if (theme == 'Dark') {
        return Themes().inactiveButtonDark;
      }
    }
  }

}
