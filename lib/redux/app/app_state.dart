import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:obs_deck/data/obs_websocket.dart';
import 'package:obs_deck/redux/settings/settings_state.dart';
import 'package:obs_deck/redux/switcher/switcher_state.dart';

@immutable
class AppState {
  final SwitcherState switcherState;
  final SettingsState settingsState;
  final ObsWebsocket obs;
  final SharedPreferences prefs;

  AppState({
    @required this.switcherState,
    @required this.settingsState,
    @required this.obs,
    @required this.prefs,
  });

  factory AppState.initial(SharedPreferences preferences) {
    return AppState(
      switcherState: SwitcherState.initial(),
      settingsState: SettingsState.initial(addr: preferences.getString('address'), pt: preferences.getString('port'), pass: preferences.getString('password')),
      obs: new ObsWebsocket(),
      prefs: preferences,
    );
  }

  AppState copyWith({
    SwitcherState switcherState,
    SettingsState settingsState,
  }) {
    return AppState(
      switcherState: switcherState ?? this.switcherState,
      settingsState: settingsState ?? this.settingsState,
      obs: obs ?? this.obs,
      prefs: prefs ?? this.prefs,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppState && switcherState == other.switcherState && settingsState == other.settingsState && obs == other.obs && prefs == other.prefs;

  @override
  int get hashCode => switcherState.hashCode ^ settingsState.hashCode ^ obs.hashCode ^ prefs.hashCode;
}
