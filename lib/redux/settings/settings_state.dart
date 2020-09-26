import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class SettingsState {
  SettingsState({
    this.connectButtonLabel,
    this.connectButtonColor,
    this.streamButtonLabel,
    this.streamButtonColor,
    this.recordButtonLabel,
    this.recordButtonColor,
    this.pauseButtonLabel,
    this.pauseButtonColor,
    this.studioButtonLabel,
    this.studioButtonColor,
    this.address,
    this.port,
    this.password,
  });

  // control buttons
  final String connectButtonLabel;
  final Color connectButtonColor;
  final String streamButtonLabel;
  final Color streamButtonColor;
  final String recordButtonLabel;
  final Color recordButtonColor;
  final String pauseButtonLabel;
  final Color pauseButtonColor;
  final String studioButtonLabel;
  final Color studioButtonColor;

  final TextEditingController address;
  final TextEditingController port;
  final TextEditingController password;

  factory SettingsState.initial({String addr, String pt, String pass}) {
    return SettingsState(
      connectButtonLabel: 'Connect',
      connectButtonColor: Colors.grey[300],
      streamButtonLabel: 'Start Streaming',
      streamButtonColor: Colors.grey[300],
      recordButtonLabel: 'Start Recording',
      recordButtonColor: Colors.grey[300],
      pauseButtonLabel: 'Pause Recording',
      pauseButtonColor: Colors.grey[300],
      studioButtonLabel: 'Studio Mode',
      studioButtonColor: Colors.grey[300],
      address: TextEditingController(text: addr ?? '127.0.0.1'),
      port: TextEditingController(text: pt ?? '4444'),
      password: TextEditingController(text: pass ?? '123456'),
    );
  }

  SettingsState copyWith({
    connectButtonLabel,
    connectButtonColor,
    streamButtonLabel,
    streamButtonColor,
    recordButtonLabel,
    recordButtonColor,
    pauseButtonLabel,
    pauseButtonColor,
    studioButtonLabel,
    studioButtonColor,
    TextEditingController address,
    TextEditingController port,
    TextEditingController password,
  }) {
    return SettingsState(
      connectButtonLabel: connectButtonLabel ?? this.connectButtonLabel,
      connectButtonColor: connectButtonColor ?? this.connectButtonColor,
      streamButtonLabel: streamButtonLabel ?? this.streamButtonLabel,
      streamButtonColor: streamButtonColor ?? this.streamButtonColor,
      recordButtonLabel: recordButtonLabel ?? this.recordButtonLabel,
      recordButtonColor: recordButtonColor ?? this.recordButtonColor,
      pauseButtonLabel: pauseButtonLabel ?? this.pauseButtonLabel,
      pauseButtonColor: pauseButtonColor ?? this.pauseButtonColor,
      studioButtonLabel: studioButtonLabel ?? this.studioButtonLabel,
      studioButtonColor: studioButtonColor ?? this.studioButtonColor,
      address: address ?? this.address,
      port: port ?? this.port,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsState &&
          connectButtonLabel == other.connectButtonLabel &&
          connectButtonColor == other.connectButtonColor &&
          streamButtonLabel == other.streamButtonLabel &&
          streamButtonColor == other.streamButtonColor &&
          recordButtonLabel == other.recordButtonLabel &&
          recordButtonColor == other.recordButtonColor &&
          pauseButtonLabel == other.pauseButtonLabel &&
          pauseButtonColor == other.pauseButtonColor &&
          studioButtonLabel == other.studioButtonLabel &&
          studioButtonColor == other.studioButtonColor &&
          address == other.address &&
          port == other.port &&
          password == other.password;

  @override
  int get hashCode =>
      connectButtonLabel.hashCode ^
      connectButtonColor.hashCode ^
      streamButtonLabel.hashCode ^
      streamButtonColor.hashCode ^
      recordButtonLabel.hashCode ^
      recordButtonColor.hashCode ^
      pauseButtonLabel.hashCode ^
      pauseButtonColor.hashCode ^
      studioButtonLabel.hashCode ^
      studioButtonColor.hashCode ^
      address.hashCode ^
      port.hashCode ^
      password.hashCode;
}
