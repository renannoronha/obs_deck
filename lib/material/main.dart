import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/material/switcher_page.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:redux/redux.dart';

class MyAndroidApp extends StatelessWidget {
  MyAndroidApp(this.store) {
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
