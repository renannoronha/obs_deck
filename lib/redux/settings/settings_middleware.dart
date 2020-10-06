import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:obs_deck/data/obs_websocket.dart';
import 'package:obs_deck/model/scene.dart';
import 'package:obs_deck/model/source.dart';
import 'package:obs_deck/model/stats.dart';
import 'package:obs_deck/model/transition.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';

class SettingsMiddleware extends MiddlewareClass<AppState> {
  SettingsMiddleware();

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is ToggleConnectAction) {
      return await _connectToObs(store.state, store.state.obs, next);
    } else if (action is ToggleStreamAction) {
      return await _streaming(store.state, store.state.obs, next, action);
    } else if (action is ToggleRecordAction) {
      return await _recording(store.state, store.state.obs, next, action);
    } else if (action is TogglePauseAction) {
      return await _pause(store.state, store.state.obs, next, action);
    } else if (action is ToggleStudioAction) {
      return await _studioMode(store.state, store.state.obs, next, action);
    }
    return next(action);
  }

  Future<void> _connectToObs(AppState state, ObsWebsocket obs, NextDispatcher next) async {
    try {
      state.obs.setAddress(state.settingsState.address.text);
      state.obs.setPort(state.settingsState.port.text);
      state.obs.setPassword(state.settingsState.password.text);

      state.prefs.setString('address', state.settingsState.address.text);
      state.prefs.setString('port', state.settingsState.port.text);
      state.prefs.setString('password', state.settingsState.password.text);

      await state.obs.connect();
      await this.refreshInterface(state, next);
      _registerListeners(state, next);
      return next(ToggleConnectAction(true));
    } catch (e) {
      print('CONECTION ERROR: ' + e.toString());
      return next(ToggleConnectAction(false));
    }
  }

  Future<void> _streaming(AppState state, ObsWebsocket obs, NextDispatcher next, ToggleStreamAction action) async {
    try {
      String command;
      if (action.toggle) {
        command = 'StartStreaming';
      } else {
        command = 'StopStreaming';
      }
      await state.obs.send(command);
      return next(action);
    } catch (e) {
      print('STREAMING ERROR: ' + e.toString());

      // treat error message from obs-websocket
      try {
        var response = json.decode(e.toString().replaceAll('Exception: ', ''));
        if (response['error'] == 'streaming already active') {
          print('TOGGLE BUTTON TRUE');
          return next(ToggleStreamAction(true));
        } else if (response['error'] == 'streaming not active') {
          print('TOGGLE BUTTON FALSE');
          return next(ToggleStreamAction(false));
        }
      } catch (e) {
        print('TREAT ERROR MESSAGE STREAMING ERROR: ' + e.toString());
      }

      // default return
      return next(ToggleStreamAction(false));
    }
  }

  Future<void> _recording(AppState state, ObsWebsocket obs, NextDispatcher next, ToggleRecordAction action) async {
    try {
      String command;
      if (action.toggle) {
        command = 'StartRecording';
      } else {
        command = 'StopRecording';
      }
      await state.obs.send(command);
      return next(action);
    } catch (e) {
      print('RECORDING ERROR: ' + e.toString());

      // treat error message from obs-websocket
      try {
        var response = json.decode(e.toString().replaceAll('Exception: ', ''));
        if (response['error'] == 'recording already active') {
          print('TOGGLE BUTTON TRUE');
          return next(ToggleRecordAction(true));
        } else if (response['error'] == 'recording not active') {
          print('TOGGLE BUTTON FALSE');
          return next(ToggleRecordAction(false));
        }
      } catch (e) {
        print('TREAT ERROR MESSAGE RECORDING ERROR: ' + e.toString());
      }

      // default return
      return next(ToggleRecordAction(false));
    }
  }

  Future<void> _pause(AppState state, ObsWebsocket obs, NextDispatcher next, TogglePauseAction action) async {
    try {
      String command;
      if (action.toggle) {
        command = 'PauseRecording';
      } else {
        command = 'ResumeRecording';
      }
      await state.obs.send(command);
      return next(action);
    } catch (e) {
      print('PAUSE ERROR: ' + e.toString());

      // treat error message from obs-websocket
      try {
        var response = json.decode(e.toString().replaceAll('Exception: ', ''));
        if (response['error'] == 'recording already paused') {
          print('TOGGLE BUTTON TRUE');
          return next(TogglePauseAction(true));
        } else if (response['error'] == 'recording is not paused' || response['error'] == 'recording is not active') {
          print('TOGGLE BUTTON FALSE');
          return next(TogglePauseAction(false));
        }
      } catch (e) {
        print('TREAT ERROR MESSAGE PAUSE ERROR: ' + e.toString());
      }

      // default return
      return next(TogglePauseAction(false));
    }
  }

  Future<void> _studioMode(AppState state, ObsWebsocket obs, NextDispatcher next, ToggleStudioAction action) async {
    try {
      String command;
      if (action.toggle) {
        command = 'EnableStudioMode';
      } else {
        command = 'DisableStudioMode';
      }
      await state.obs.send(command);
      return next(action);
    } catch (e) {
      print('STUDIO MODE ERROR: ' + e.toString());

      // treat error message from obs-websocket
      try {
        var response = json.decode(e.toString().replaceAll('Exception: ', ''));
        if (response['error'] == 'studio mode already active') {
          print('TOGGLE BUTTON TRUE');
          return next(ToggleStudioAction(true));
        }
      } catch (e) {
        print('TREAT ERROR MESSAGE STUDIO MODE ERROR: ' + e.toString());
      }

      // default return
      return next(ToggleStudioAction(false));
    }
  }

  Future<void> refreshInterface(AppState state, NextDispatcher next) async {
    try {
      ObsWebsocket obs = state.obs;

      // GetStudioModeStatus
      var getStudioModeStatus = await obs.send('GetStudioModeStatus');

      // GetStreamingStatus
      var getStreamingStatus = await obs.send('GetStreamingStatus');

      // reload settings buttons
      next(
        NewSettingsInterfaceAction(
          ToggleStreamAction(getStreamingStatus['streaming']),
          ToggleRecordAction(getStreamingStatus['recording']),
          TogglePauseAction(getStreamingStatus['recording-paused']),
          ToggleStudioAction(getStudioModeStatus['studio-mode']),
        ),
      );

      // GetSceneList
      var getSceneList = await obs.send('GetSceneList');
      List<Scene> programList = [];
      List<Source> sourceListProgram = [];
      for (dynamic scene in getSceneList['scenes']) {
        programList.add(Scene(scene['name'], scene['name'] == getSceneList['current-scene']));
        if (scene['name'] == getSceneList['current-scene']) {
          for (dynamic source in scene['sources']) {
            sourceListProgram.add(Source(source['name'], source['render']));
          }
        }
      }

      // GetPreviewScene
      List<Scene> previewList = [];
      List<Source> sourceListPreview = [];
      try {
        var getPreviewScene = await obs.send('GetPreviewScene');
        for (dynamic scene in getSceneList['scenes']) {
          previewList.add(Scene(scene['name'], scene['name'] == getPreviewScene['name']));
          if (scene['name'] == getPreviewScene['name']) {
            for (dynamic source in scene['sources']) {
              sourceListPreview.add(Source(source['name'], source['render']));
            }
          }
        }
      } catch (e) {
        var response = json.decode(e.toString().replaceAll('Exception: ', ''));
        print('GetPreviewScene ERROR: ' + response['error']);
      }
      List<Source> sourceList = getStudioModeStatus['studio-mode'] ? sourceListPreview : sourceListProgram;

      // GetTransitionList
      var getTransitionList = await obs.send('GetTransitionList');
      List<Transition> transitionList = [];
      for (dynamic transition in getTransitionList['transitions']) {
        transitionList.add(
            Transition(transition['name'], 300, transition['name'] == getTransitionList['current-transition'], false));
      }

      // reload switcher interface
      next(NewSwitcherInterfaceAction(programList, previewList, sourceList, transitionList));
    } catch (e) {
      print('REFRESH INTERFACE ERROR' + e.toString());
    }
  }

  void _registerListeners(AppState state, NextDispatcher next) {
    try {
      ObsWebsocket obs = state.obs;

      // conection
      obs.event('SourceDestroyed').listen((event) {
        print('SourceDestroyed: ' + event.toString());
        next(ToggleConnectAction(false));
      });

      // streaming
      // obs.event('StreamStarting').listen((event) {
      //   print('StreamStarting: ' + event.toString());
      //   next(ToggleStreamAction(true));
      // });
      obs.event('StreamStarted').listen((event) {
        print('StreamStarted: ' + event.toString());
        next(ToggleStreamAction(true));
      });
      // obs.event('StreamStopping').listen((event) {
      //   print('StreamStopping: ' + event.toString());
      //   next(ToggleStreamAction(true));
      // });
      obs.event('StreamStopped').listen((event) {
        print('StreamStopped: ' + event.toString());
        next(ToggleStreamAction(false));
      });

      // status
      obs.event('StreamStatus').listen((event) {
        // $("#cpuUsage").html(data.cpuUsage.toFixed(2) + "%");
        // $("#fps").html(data.fps.toFixed(0));
        // $("#kbitsPerSec").html(data.kbitsPerSec);
        // $("#memoryUsage").html(data.memoryUsage.toFixed(2) + " MB");
        // $("#recTimecode").html(data.recTimecode);
        // $("#strain").html(data.strain.toFixed(2));
        // $("#streamTimecode").html(data.streamTimecode);
        print('StreamStatus: ' +
            event['stream-timecode'].toString() +
            ' at ' +
            event['kbits-per-sec'].toString() +
            'Kb/s');
        next(
          StatsAction(
            Stats(
              streaming: event['stream-timecode'].toString().substring(0, 8),
              upload: event['kbits-per-sec'].toString(),
              cpuUsage: event['cpu-usage'].toStringAsFixed(2),
              fps: event['fps'].toStringAsFixed(0),
            ),
          ),
        );
      });

      // recording
      // obs.event('RecordingStarting').listen((event) {
      //   print('RecordingStarting: ' + event['new-state'].toString());
      //   next(ToggleRecordAction(event['new-state']));
      // });
      obs.event('RecordingStarted').listen((event) {
        print('RecordingStarted: ' + event.toString());
        next(ToggleRecordAction(true));
      });
      // obs.event('RecordingStopping').listen((event) {
      //   print('RecordingStopping: ' + event['new-state'].toString());
      //   next(ToggleRecordAction(event['new-state']));
      // });
      obs.event('RecordingStopped').listen((event) {
        print('RecordingStopped: ' + event.toString());
        next(ToggleRecordAction(false));
        next(TogglePauseAction(false));
      });
      obs.event('RecordingPaused').listen((event) {
        print('RecordingPaused: ' + event.toString());
        next(TogglePauseAction(true));
        next(ToggleRecordAction(true));
      });
      obs.event('RecordingResumed').listen((event) {
        print('RecordingResumed: ' + event.toString());
        next(TogglePauseAction(false));
        next(ToggleRecordAction(true));
      });

      // studio mode
      obs.event('StudioModeSwitched').listen((event) {
        print('STUDIO MODE SWITCHED STATE TO: ' + event['new-state'].toString());
        this.refreshInterface(state, next);
        next(ToggleStudioAction(event['new-state']));
      });

      // Scenes changed
      obs.event('SwitchScenes').listen((event) {
        print('SwitchScenes EVENT: ' + event.toString());
        List<Source> sourceList = [];
        for (dynamic source in event['sources']) {
          sourceList.add(Source(source['name'], source['render']));
        }

        next(CurrentProgramSceneAction(event['scene-name']));
        next(CurrentSourceListAction(sourceList, 'program'));
      });
      obs.event('PreviewSceneChanged').listen((event) {
        print('PreviewSceneChanged EVENT: ' + event.toString());
        List<Source> sourceList = [];
        for (dynamic source in event['sources']) {
          sourceList.add(Source(source['name'], source['render']));
        }

        next(CurrentPreviewSceneAction(event['scene-name']));
        next(CurrentSourceListAction(sourceList, 'preview'));
      });

      // Transition changed
      obs.event('SwitchTransition').listen((event) {
        print('SwitchTransition EVENT: ' + event.toString());
        next(CurrentTransitionAction(event['transition-name']));
      });
      obs.event('TransitionBegin').listen((event) {
        print('TransitionBegin EVENT: ' + event.toString());
        next(LiveTransitionAction(event['name'], true));
      });
      obs.event('TransitionEnd').listen((event) {
        print('TransitionEnd EVENT: ' + event.toString());
        next(LiveTransitionAction(event['name'], false));
      });

      // Sources events
      obs.event('SceneItemVisibilityChanged').listen((event) {
        print('SceneItemVisibilityChanged EVENT: ' + event.toString());
        next(ToggleSourceAction(Source(event['item-name'], event['item-visible'])));
      });
    } catch (e) {
      print('SETTINGS LISTENERS ERROR: ' + e.toString());
    }
  }
}
