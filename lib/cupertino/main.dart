import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/cupertino/switcher_page.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:redux/redux.dart';

class MyCupertinoApp extends StatelessWidget {
  MyCupertinoApp(this.store) {
    this.store.dispatch(ToggleConnectAction(true));
  }
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: this.store,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'OBS Deck',
        theme: CupertinoThemeData(
          primaryColor: const Color(0xFF1C306D),
          // accentColor: const Color(0xFFFFAD32),
          scaffoldBackgroundColor: CupertinoColors.white,
        ),
        home: StoreBuilder<AppState>(
          builder: (context, store) => SwitcherPage(),
        ),
      ),
    );
  }
}
