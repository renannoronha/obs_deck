import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_reducer.dart';
import 'package:obs_deck/redux/switcher/switcher_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    switcherState: switcherReducer(state, action),
    settingsState: settingsReducer(state, action),
    obs: state.obs,
    prefs: state.prefs,
  );
}
