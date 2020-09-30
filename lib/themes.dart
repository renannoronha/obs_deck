import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  final light = ThemeData(
    primaryColor: Colors.blue[900],
    accentColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      button: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.black),
      counterStyle: TextStyle(color: Colors.black),
    ),
    buttonColor: Colors.black,
  );

  final lightCupertino = CupertinoThemeData(
    primaryColor: const Color(0xFF1C306D),
    scaffoldBackgroundColor: CupertinoColors.white,
  );

  final dark = ThemeData(
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    textTheme: TextTheme(
      button: TextStyle(color: Colors.black),
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
        return Platform.isAndroid ? Themes().light : Themes().lightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? Themes().dark : Themes().darkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Themes().light;
      } else if (theme == 'Dark') {
        return Themes().dark;
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
        return Platform.isAndroid ? this.activeShadowLight : this.activeShadowLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.activeShadowDark : null;
        // return Platform.isAndroid ? this.activeShadowDark : this.activeShadowDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.activeShadowLight;
      } else if (theme == 'Dark') {
        return this.activeShadowDark;
      }
    }
  }

  dynamic getInactiveShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.inactiveShadowLight : this.inactiveShadowLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.inactiveShadowDark : null;
        // return Platform.isAndroid ? this.inactiveShadowDark : this.inactiveShadowDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.inactiveShadowLight;
      } else if (theme == 'Dark') {
        return this.inactiveShadowDark;
      }
    }
  }

  dynamic getActiveButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.activeButtonLight : this.activeButtonLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.activeButtonDark : null;
        // return Platform.isAndroid ? this.activeButtonDark : this.activeButtonDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.activeButtonLight;
      } else if (theme == 'Dark') {
        return this.activeButtonDark;
      }
    }
  }

  dynamic getInactiveButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.inactiveButtonLight : this.inactiveButtonLightCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.inactiveButtonDark : null;
        // return Platform.isAndroid ? this.inactiveButtonDark : this.inactiveButtonDarkCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.inactiveButtonLight;
      } else if (theme == 'Dark') {
        return this.inactiveButtonDark;
      }
    }
  }

  final List<BoxShadow> greenBoxShadow = [
    BoxShadow(color: Color.fromRGBO(22, 222, 22, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(0, 255, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> greenButton = [
    Color.fromRGBO(120, 255, 120, 1),
    Color.fromRGBO(100, 255, 100, 1),
    Color.fromRGBO(60, 255, 60, 1),
    Color.fromRGBO(0, 255, 0, 1),
  ];

  final List<BoxShadow> yellowBoxShadow = [
    BoxShadow(color: Color.fromRGBO(222, 222, 0, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> yellowButton = [
    Color.fromRGBO(255, 255, 120, 1),
    Color.fromRGBO(255, 255, 100, 1),
    Color.fromRGBO(255, 255, 60, 1),
    Color.fromRGBO(255, 255, 0, 1),
  ];

  final List<BoxShadow> redBoxShadow = [
    BoxShadow(color: Color.fromRGBO(222, 22, 22, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 0, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> redButton = [
    Color.fromRGBO(255, 120, 120, 1),
    Color.fromRGBO(255, 100, 100, 1),
    Color.fromRGBO(255, 60, 60, 1),
    Color.fromRGBO(255, 0, 0, 1),
  ];

  
  final List<BoxShadow> greenBoxShadowCupertino = [
    BoxShadow(color: Color.fromRGBO(22, 222, 22, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(0, 255, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> greenButtonCupertino = [
    Color.fromRGBO(120, 255, 120, 1),
    Color.fromRGBO(100, 255, 100, 1),
    Color.fromRGBO(60, 255, 60, 1),
    Color.fromRGBO(0, 255, 0, 1),
  ];

  final List<BoxShadow> yellowBoxShadowCupertino = [
    BoxShadow(color: Color.fromRGBO(222, 222, 0, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> yellowButtonCupertino = [
    Color.fromRGBO(255, 255, 120, 1),
    Color.fromRGBO(255, 255, 100, 1),
    Color.fromRGBO(255, 255, 60, 1),
    Color.fromRGBO(255, 255, 0, 1),
  ];

  final List<BoxShadow> redBoxShadowCupertino = [
    BoxShadow(color: Color.fromRGBO(222, 22, 22, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 0, 0, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> redButtonCupertino = [
    Color.fromRGBO(255, 120, 120, 1),
    Color.fromRGBO(255, 100, 100, 1),
    Color.fromRGBO(255, 60, 60, 1),
    Color.fromRGBO(255, 0, 0, 1),
  ];

  dynamic getGreenButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.greenButton : this.greenButtonCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.greenButton : this.greenButtonCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.greenButton;
      } else if (theme == 'Dark') {
        return this.greenButton;
      }
    }
  }

  dynamic getGreenShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.greenBoxShadow : this.greenBoxShadowCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.greenBoxShadow : this.greenBoxShadowCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.greenBoxShadow;
      } else if (theme == 'Dark') {
        return this.greenBoxShadow;
      }
    }
  }

  dynamic getYellowButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.yellowButton : this.yellowButtonCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.yellowButton : this.yellowButtonCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.yellowButton;
      } else if (theme == 'Dark') {
        return this.yellowButton;
      }
    }
  }

  dynamic getYellowShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.yellowBoxShadow : this.yellowBoxShadowCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.yellowBoxShadow : this.yellowBoxShadowCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.yellowBoxShadow;
      } else if (theme == 'Dark') {
        return this.yellowBoxShadow;
      }
    }
  }

  dynamic getRedButton(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.redButton : this.redButtonCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.redButton : this.redButtonCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.redButton;
      } else if (theme == 'Dark') {
        return this.redButton;
      }
    }
  }

  dynamic getRedShadow(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? this.redBoxShadow : this.redBoxShadowCupertino;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? this.redBoxShadow : this.redBoxShadowCupertino;
      }
    } catch (e) {
      if (theme == 'Light') {
        return this.redBoxShadow;
      } else if (theme == 'Dark') {
        return this.redBoxShadow;
      }
    }
  }

  dynamic getDropdownColor(String theme) {
    try {
      if (theme == 'Light') {
        return Platform.isAndroid ? Colors.black : CupertinoColors.black;
      } else if (theme == 'Dark') {
        return Platform.isAndroid ? Colors.white : CupertinoColors.white;
      }
    } catch (e) {
      if (theme == 'Light') {
        return Colors.black;
      } else if (theme == 'Dark') {
        return Colors.white;
      }
    }
  }
}
