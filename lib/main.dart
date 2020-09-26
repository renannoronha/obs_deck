import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:obs_deck/redux/store.dart';
import 'package:obs_deck/ui/switcher_page.dart';

Future<void> main() async {
  final prefs = await SharedPreferences.getInstance();
  final store = createStore(prefs);
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  MyApp(this.store) {
    this.store.dispatch(ToggleConnectAction(true));
  }
  final Store<AppState> store;
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OBS Deck',
        theme: ThemeData(
          primaryColor: const Color(0xFF1C306D),
          accentColor: const Color(0xFFFFAD32),
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: StoreBuilder<AppState>(
          builder: (context, store) => SwitcherPage(),
        ),
      ),
    );
  }
}
