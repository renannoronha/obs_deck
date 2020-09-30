import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:obs_deck/cupertino/main.dart';
import 'package:obs_deck/material/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:obs_deck/redux/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final store = createStore(prefs);
  try {
    if (Platform.isAndroid) {
      runApp(MyAndroidApp(store));
    } else if (Platform.isIOS) {
      runApp(MyCupertinoApp(store));
    }
  } catch (e) {
    print('Error MAIN: ' + e.toString());
    if (e.toString() == 'Unsupported operation: Platform._operatingSystem') {
      runApp(MyAndroidApp(store));
    }
  }
}
