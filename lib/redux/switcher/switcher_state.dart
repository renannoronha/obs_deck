import 'package:flutter/widgets.dart';
import 'package:obs_deck/model/scene.dart';
import 'package:obs_deck/model/source.dart';
import 'package:obs_deck/model/stats.dart';
import 'package:obs_deck/model/transition.dart';

@immutable
class SwitcherState {
  SwitcherState({
    @required this.previewList,
    @required this.programList,
    @required this.transitionList,
    @required this.sourceList,
    @required this.stats,
  });

  final List<Scene> previewList;
  final List<Scene> programList;
  final List<Transition> transitionList;
  final List<Source> sourceList;
  final Stats stats;

  factory SwitcherState.initial() {
    return SwitcherState(
      previewList: [],
      programList: [],
      transitionList: [],
      sourceList: [],
      stats: Stats(
        streaming: '00:00:00',
        recording: '00:00:00',
        upload: '0',
        cpuUsage: '0',
        fps: '0',
        memoryUsage: '0',
        strain: '0',
      ),
    );
  }

  SwitcherState copyWith({
    List<Scene> previewList,
    List<Scene> programList,
    List<Transition> transitionList,
    List<Source> sourceList,
    Stats stats,
  }) {
    return SwitcherState(
      previewList: previewList ?? this.previewList,
      programList: programList ?? this.programList,
      transitionList: transitionList ?? this.transitionList,
      sourceList: sourceList ?? this.sourceList,
      stats: stats ?? this.stats,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwitcherState &&
          previewList == other.previewList &&
          programList == other.programList &&
          transitionList == other.transitionList &&
          sourceList == other.sourceList &&
          stats == other.stats;

  @override
  int get hashCode => previewList.hashCode ^ programList.hashCode ^ transitionList.hashCode ^ sourceList.hashCode ^ stats.hashCode;
}
