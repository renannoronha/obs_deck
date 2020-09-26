import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:obs_deck/redux/app/app_reducer.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_middleware.dart';
import 'package:obs_deck/redux/switcher/switcher_middleware.dart';

Store<AppState> createStore(SharedPreferences prefs) {

  return Store(
    appReducer,
    initialState: AppState.initial(prefs),
    distinct: true,
    middleware: [
      SwitcherMiddleware(),
      SettingsMiddleware(),
    ],
  );
}
