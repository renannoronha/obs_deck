// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Settings"),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      controller: state.settingsState.address,
                      placeholder: 'Address',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      controller: state.settingsState.port,
                      placeholder: 'Port',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      controller: state.settingsState.password,
                      obscureText: true,
                      placeholder: 'Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CupertinoButton(
                      color: state.settingsState.connectButtonColor,
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(ToggleConnectAction(null));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.connectButtonLabel,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.streamButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.streamButtonColor ==
                            CupertinoColors.systemRed) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context)
                            .dispatch(ToggleStreamAction(toggle));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.streamButtonLabel,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.recordButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.recordButtonColor ==
                            CupertinoColors.systemRed) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context)
                            .dispatch(ToggleRecordAction(toggle));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.recordButtonLabel,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.pauseButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.pauseButtonColor ==
                            CupertinoColors.systemYellow) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context)
                            .dispatch(TogglePauseAction(toggle));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.pauseButtonLabel,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.studioButtonColor,
                      onPressed: () {
                        bool toggle;
                        if (state.settingsState.studioButtonColor ==
                            CupertinoColors.systemGreen) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context)
                            .dispatch(ToggleStudioAction(toggle));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.studioButtonLabel,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}