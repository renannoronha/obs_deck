import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:obs_deck/data/obs_websocket.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';

class SwitcherMiddleware extends MiddlewareClass<AppState> {
  SwitcherMiddleware();
  // final FinnkinoApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is ToggleProgramAction) {
      return await _programToggle(store.state, store.state.obs, next, action);
    } else if (action is TogglePreviewAction) {
      return await _previewToggle(store.state, store.state.obs, next, action);
    } else if (action is ToggleTransitionAction) {
      return await _transitionToggle(store.state, store.state.obs, next, action);
    } else if (action is ChangeSceneAction) {
      return await _liveToggle(store.state, store.state.obs, next, action);
    }
    return next(action);
  }

  Future<void> _programToggle(AppState state, ObsWebsocket obs, NextDispatcher next, ToggleProgramAction action) async {
    try {
      if (state.settingsState.studioButtonColor != Colors.green) {
        await state.obs.send('SetCurrentScene', {"scene-name": action.scene.name});
      }
      return next(action);
    } catch (e) {
      print('SetPreviewScene ERROR: ' + e.toString());
    }
  }

  Future<void> _previewToggle(AppState state, ObsWebsocket obs, NextDispatcher next, TogglePreviewAction action) async {
    try {
      if (state.settingsState.studioButtonColor == Colors.green) {
        await state.obs.send('SetPreviewScene', {"scene-name": action.scene.name});
      }
      return next(action);
    } catch (e) {
      print('SetPreviewScene ERROR: ' + e.toString());
    }
  }

  Future<void> _transitionToggle(AppState state, ObsWebsocket obs, NextDispatcher next, ToggleTransitionAction action) async {
    try {
      await state.obs.send('SetCurrentTransition', {"transition-name": action.transition.name});
      return next(action);
    } catch (e) {
      print('SetCurrentTransition ERROR: ' + e.toString());
    }
  }

  Future<void> _liveToggle(AppState state, ObsWebsocket obs, NextDispatcher next, ChangeSceneAction action) async {
    try {
      await state.obs.send('TransitionToProgram', {
        "with-transition": {"name": action.transition.name, "duration": action.transition.duration}
      });
      return next(action);
    } catch (e) {
      print('TransitionToProgram ERROR: ' + e.toString());
    }
  }
}
