import 'package:obs_deck/model/scene.dart';
import 'package:obs_deck/model/source.dart';
import 'package:obs_deck/model/stats.dart';
import 'package:obs_deck/model/transition.dart';

class TogglePreviewAction {
  final Scene scene;

  TogglePreviewAction(this.scene);
}

class ToggleProgramAction {
  final Scene scene;

  ToggleProgramAction(this.scene);
}

class ToggleTransitionAction {
  final Transition transition;

  ToggleTransitionAction(this.transition);
}

class ToggleSourceAction {
  final Source source;

  ToggleSourceAction(this.source);
}

class ChangeSceneAction {
  final Transition transition;

  ChangeSceneAction(this.transition);
}

class StatsAction {
  final Stats stats;

  StatsAction(this.stats);
}

class NewProgramListAction {
  final List<Scene> program;

  NewProgramListAction(this.program);
}

class NewPreviewListAction {
  final List<Scene> preview;

  NewPreviewListAction(this.preview);
}

class NewTransitionListAction {
  final List<Transition> transition;

  NewTransitionListAction(this.transition);
}

class NewSwitcherInterfaceAction {
  final List<Scene> program;
  final List<Scene> preview;
  final List<Source> source;
  final List<Transition> transition;

  NewSwitcherInterfaceAction(this.program, this.preview, this.source, this.transition);
}

class CurrentProgramSceneAction {
  final String name;

  CurrentProgramSceneAction(this.name);
}

class CurrentPreviewSceneAction {
  final String name;

  CurrentPreviewSceneAction(this.name);
}

class CurrentTransitionAction {
  final String name;
  
  CurrentTransitionAction(this.name);
}

class CurrentSourceListAction {
  final List<Source> source;
  final String actionSource;

  CurrentSourceListAction(this.source, this.actionSource);
}

class LiveTransitionAction {
  final String name;
  final bool live;

  LiveTransitionAction(this.name, this.live);
}