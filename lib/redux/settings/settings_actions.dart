class ToggleConnectAction {
  final bool toggle;

  ToggleConnectAction(this.toggle);
}

class ToggleStreamAction {
  final bool toggle;
  
  ToggleStreamAction(this.toggle);
}

class ToggleRecordAction {
  final bool toggle;
  
  ToggleRecordAction(this.toggle);
}

class TogglePauseAction {
  final bool toggle;
  
  TogglePauseAction(this.toggle);
}

class ToggleStudioAction {
  final bool toggle;
  
  ToggleStudioAction(this.toggle);
}

class NewSettingsInterfaceAction {
  ToggleStreamAction stream;
  ToggleRecordAction record;
  TogglePauseAction pause;
  ToggleStudioAction studio;

  NewSettingsInterfaceAction(this.stream, this.record, this.pause, this.studio);
}