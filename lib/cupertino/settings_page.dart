// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';
import 'package:obs_deck/themes.dart';

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
                        StoreProvider.of<AppState>(context).dispatch(ToggleConnectAction(null));
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
                    padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.streamButtonColor,
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(ToggleStreamAction(state.settingsState.stream));
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
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.recordButtonColor,
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(ToggleRecordAction(!state.settingsState.record));
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
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.pauseButtonColor,
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(TogglePauseAction(!state.settingsState.pause));
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
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      color: state.settingsState.studioButtonColor,
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(ToggleStudioAction(!state.settingsState.studioMode));
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: CupertinoButton(
                      // color: Color.fromRGBO(199, 199, 199, 1),
                      onPressed: () {
                        final act = CupertinoActionSheet(
                            title: Text('Select a Theme'),
                            // message: Text('Which option?'),
                            actions: <Widget>[
                              CupertinoActionSheetAction(
                                child: Text('Light'),
                                onPressed: () {
                                  StoreProvider.of<AppState>(context).dispatch(ChangeThemeAction('Light'));
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text('Dark'),
                                onPressed: () {
                                  StoreProvider.of<AppState>(context).dispatch(ChangeThemeAction('Dark'));
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ));
                        showCupertinoModalPopup(context: context, builder: (BuildContext context) => act);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            state.settingsState.theme,
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
