import 'package:flutter/material.dart';
import 'package:obs_deck/model/scene.dart';
import 'package:obs_deck/model/source.dart';
import 'package:obs_deck/model/transition.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';
import 'package:obs_deck/redux/switcher/switcher_state.dart';

SwitcherState switcherReducer(AppState state, dynamic action) {
  if (action is StatsAction) {
    return state.switcherState.copyWith(stats: action.stats);
  } else if (action is NewProgramListAction) {
    return state.switcherState.copyWith(programList: action.program);
  } else if (action is NewPreviewListAction) {
    return state.switcherState.copyWith(previewList: action.preview);
  } else if (action is NewTransitionListAction) {
    return state.switcherState.copyWith(transitionList: action.transition);
  } else if (action is NewSwitcherInterfaceAction) {
    return state.switcherState.copyWith(programList: action.program, previewList: action.preview, sourceList: action.source, transitionList: action.transition);
  } else if (action is CurrentProgramSceneAction) {
    return state.switcherState.copyWith(programList: _newProgramList(state.switcherState.programList, action));
  } else if (action is CurrentPreviewSceneAction) {
    return state.switcherState.copyWith(previewList: _newPreviewList(state.switcherState.previewList, action));
  } else if (action is CurrentTransitionAction) {
    return state.switcherState.copyWith(transitionList: _newTransitionList(state.switcherState.transitionList, action));
  } else if (action is CurrentSourceListAction) {
    return state.switcherState.copyWith(sourceList: action.source);
  } else if (action is LiveTransitionAction) {
    return state.switcherState.copyWith(transitionList: _liveTransitionList(state.switcherState.transitionList, action));
  } else if (action is ToggleSourceAction) {
    return state.switcherState.copyWith(sourceList: _toggleSourceState(state.switcherState.sourceList, action));
  }
  return state.switcherState;
}

// List<Scene> _togglePreviewState(List<Scene> itens, TogglePreviewAction action) {
//   // return list with new activated scene
//   return itens.map((e) => e.name == action.scene.name ? Scene(e.name, true) : Scene(e.name, false)).toList();
// }

List<Scene> _newProgramList(List<Scene> itens, CurrentProgramSceneAction action) {
  // return list with new activated scene
  return itens.map((e) => e.name == action.name ? Scene(e.name, true) : Scene(e.name, false)).toList();
}

List<Scene> _newPreviewList(List<Scene> itens, CurrentPreviewSceneAction action) {
  // return list with new activated scene
  return itens.map((e) => e.name == action.name ? Scene(e.name, true) : Scene(e.name, false)).toList();
}

List<Transition> _newTransitionList(List<Transition> itens, CurrentTransitionAction action) {
  // return list with new activated scene
  return itens.map((e) => e.name == action.name ? Transition(e.name, e.duration, true, false) : Transition(e.name, e.duration, false, false)).toList();
}

List<Transition> _liveTransitionList(List<Transition> itens, LiveTransitionAction action) {
  print('LIVE TRANSITION ACTION: ' + action.name + ' - ' + action.live.toString());
  // return list with new activated scene
  return itens.map((e) => e.name == action.name ? Transition(e.name, e.duration, e.active, action.live) : Transition(e.name, e.duration, e.active, false)).toList();
}

List<Source> _toggleSourceState(List<Source> state, ToggleSourceAction action) {
  return state.map((item) => item.name == action.source.name ? action.source : item).toList();
}

// SwitcherState _changeScene(SwitcherState state, ChangeSceneAction action) {
//   return state;
// }
