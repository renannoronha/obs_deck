// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/settings/settings_actions.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: state.settingsState.address,
                      decoration: const InputDecoration(
                        hintText: 'Your computer\'s IP',
                        labelText: 'Address',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: state.settingsState.port,
                      decoration: const InputDecoration(
                        hintText: 'Your configured port',
                        labelText: 'Port',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: state.settingsState.password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RaisedButton(
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
                    child: RaisedButton(
                      color: state.settingsState.streamButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.streamButtonColor == Colors.red) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context).dispatch(ToggleStreamAction(toggle));
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
                    child: RaisedButton(
                      color: state.settingsState.recordButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.recordButtonColor == Colors.red) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context).dispatch(ToggleRecordAction(toggle));
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
                    child: RaisedButton(
                      color: state.settingsState.pauseButtonColor,
                      onPressed: () {
                        var toggle;
                        if (state.settingsState.pauseButtonColor == Colors.yellow) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context).dispatch(TogglePauseAction(toggle));
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
                    child: RaisedButton(
                      color: state.settingsState.studioButtonColor,
                      onPressed: () {
                        bool toggle;
                        if (state.settingsState.studioButtonColor == Colors.green) {
                          toggle = false;
                        } else {
                          toggle = true;
                        }
                        StoreProvider.of<AppState>(context).dispatch(ToggleStudioAction(toggle));
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
