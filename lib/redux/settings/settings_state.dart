import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class SettingsState {
  SettingsState({
    this.connectButtonLabel,
    this.connectButtonColor,
    this.connect,
    this.streamButtonLabel,
    this.streamButtonColor,
    this.stream,
    this.recordButtonLabel,
    this.recordButtonColor,
    this.record,
    this.pauseButtonLabel,
    this.pauseButtonColor,
    this.pause,
    this.studioButtonLabel,
    this.studioButtonColor,
    this.studioMode,
    this.address,
    this.port,
    this.password,
  });

  // control buttons
  final String connectButtonLabel;
  final Color connectButtonColor;
  final bool connect;
  final String streamButtonLabel;
  final Color streamButtonColor;
  final bool stream;
  final String recordButtonLabel;
  final Color recordButtonColor;
  final bool record;
  final String pauseButtonLabel;
  final Color pauseButtonColor;
  final bool pause;
  final String studioButtonLabel;
  final Color studioButtonColor;
  final bool studioMode;

  final TextEditingController address;
  final TextEditingController port;
  final TextEditingController password;

  factory SettingsState.initial({String addr, String pt, String pass}) {
    return SettingsState(
      connectButtonLabel: 'Connect',
      connectButtonColor: Colors.grey[300],
      connect: false,
      streamButtonLabel: 'Start Streaming',
      streamButtonColor: Colors.grey[300],
      stream: false,
      recordButtonLabel: 'Start Recording',
      recordButtonColor: Colors.grey[300],
      record: false,
      pauseButtonLabel: 'Pause Recording',
      pauseButtonColor: Colors.grey[300],
      pause: false,
      studioButtonLabel: 'Studio Mode',
      studioButtonColor: Colors.grey[300],
      studioMode: false,
      address: TextEditingController(text: addr ?? '127.0.0.1'),
      port: TextEditingController(text: pt ?? '4444'),
      password: TextEditingController(text: pass ?? '123456'),
    );
  }

  SettingsState copyWith({
    connectButtonLabel,
    connectButtonColor,
    connect,
    streamButtonLabel,
    streamButtonColor,
    stream,
    recordButtonLabel,
    recordButtonColor,
    record,
    pauseButtonLabel,
    pauseButtonColor,
    pause,
    studioButtonLabel,
    studioButtonColor,
    studioMode,
    TextEditingController address,
    TextEditingController port,
    TextEditingController password,
  }) {
    return SettingsState(
      connectButtonLabel: connectButtonLabel ?? this.connectButtonLabel,
      connectButtonColor: connectButtonColor ?? this.connectButtonColor,
      connect: connect ?? this.connect,
      streamButtonLabel: streamButtonLabel ?? this.streamButtonLabel,
      streamButtonColor: streamButtonColor ?? this.streamButtonColor,
      stream: stream ?? this.stream,
      recordButtonLabel: recordButtonLabel ?? this.recordButtonLabel,
      recordButtonColor: recordButtonColor ?? this.recordButtonColor,
      record: record ?? this.record,
      pauseButtonLabel: pauseButtonLabel ?? this.pauseButtonLabel,
      pauseButtonColor: pauseButtonColor ?? this.pauseButtonColor,
      pause: pause ?? this.pause,
      studioButtonLabel: studioButtonLabel ?? this.studioButtonLabel,
      studioButtonColor: studioButtonColor ?? this.studioButtonColor,
      studioMode: studioMode ?? this.studioMode,
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
          connect == other.connect &&
          streamButtonLabel == other.streamButtonLabel &&
          streamButtonColor == other.streamButtonColor &&
          stream == other.stream &&
          recordButtonLabel == other.recordButtonLabel &&
          recordButtonColor == other.recordButtonColor &&
          record == other.record &&
          pauseButtonLabel == other.pauseButtonLabel &&
          pauseButtonColor == other.pauseButtonColor &&
          pause == other.pause &&
          studioButtonLabel == other.studioButtonLabel &&
          studioButtonColor == other.studioButtonColor &&
          studioMode == other.studioMode &&
          address == other.address &&
          port == other.port &&
          password == other.password;

  @override
  int get hashCode =>
      connectButtonLabel.hashCode ^
      connectButtonColor.hashCode ^
      connect.hashCode ^
      streamButtonLabel.hashCode ^
      streamButtonColor.hashCode ^
      stream.hashCode ^
      recordButtonLabel.hashCode ^
      recordButtonColor.hashCode ^
      record.hashCode ^
      pauseButtonLabel.hashCode ^
      pauseButtonColor.hashCode ^
      pause.hashCode ^
      studioButtonLabel.hashCode ^
      studioButtonColor.hashCode ^
      studioMode.hashCode ^
      address.hashCode ^
      port.hashCode ^
      password.hashCode;
}
