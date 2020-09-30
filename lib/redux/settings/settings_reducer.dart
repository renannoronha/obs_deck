import 'package:flutter/material.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:obs_deck/redux/settings/settings_state.dart';

SettingsState settingsReducer(AppState state, dynamic action) {
  if (action is ToggleConnectAction) {
    return _toggleConnectState(state, action);
  } else if (action is ToggleStreamAction) {
    return _toggleStreamState(state.settingsState, action);
  } else if (action is ToggleRecordAction) {
    return _toggleRecordState(state.settingsState, action);
  } else if (action is TogglePauseAction) {
    return _togglePauseState(state.settingsState, action);
  } else if (action is ToggleStudioAction) {
    return _toggleStudioState(state.settingsState, action);
  } else if (action is NewSettingsInterfaceAction) {
    AppState s = state.copyWith(settingsState: _toggleStreamState(state.settingsState, action.stream));
    s = state.copyWith(settingsState: _toggleRecordState(state.settingsState, action.record));
    s = state.copyWith(settingsState: _togglePauseState(state.settingsState, action.pause));
    s = state.copyWith(settingsState: _toggleStudioState(state.settingsState, action.studio));
    return s.settingsState;
  }
  return state.settingsState;
}

SettingsState _toggleConnectState(AppState state, ToggleConnectAction action) {
  if (action.toggle) {
    return state.settingsState.copyWith(connectButtonLabel: 'Connected', connectButtonColor: Colors.red, connect: action.toggle);
  } else {
    return state.settingsState.copyWith(connectButtonLabel: 'Connect', connectButtonColor: Colors.grey[300], connect: action.toggle);
  }
}

SettingsState _toggleStreamState(SettingsState state, ToggleStreamAction action) {
  if (action.toggle) {
    return state.copyWith(streamButtonLabel: 'Streaming', streamButtonColor: Colors.red, stream: action.toggle);
  } else {
    return state.copyWith(streamButtonLabel: 'Start Streaming', streamButtonColor: Colors.grey[300], stream: action.toggle);
  }
}

SettingsState _toggleRecordState(SettingsState state, ToggleRecordAction action) {
  if (action.toggle) {
    return state.copyWith(recordButtonLabel: 'Recording', recordButtonColor: Colors.red, record: action.toggle);
  } else {
    return state.copyWith(recordButtonLabel: 'Start Recording', recordButtonColor: Colors.grey[300], record: action.toggle);
  }
}

SettingsState _togglePauseState(SettingsState state, TogglePauseAction action) {
  if (action.toggle) {
    return state.copyWith(pauseButtonLabel: 'Resume Recording', pauseButtonColor: Colors.yellow, pause: action.toggle);
  } else {
    return state.copyWith(pauseButtonLabel: 'Pause Recording', pauseButtonColor: Colors.grey[300], pause: action.toggle);
  }
}

SettingsState _toggleStudioState(SettingsState state, ToggleStudioAction action) {
  if (action.toggle) {
    return state.copyWith(studioButtonColor: Colors.green, studioMode: action.toggle);
  } else {
    return state.copyWith(studioButtonColor: Colors.grey[300], studioMode: action.toggle);
  }
}
