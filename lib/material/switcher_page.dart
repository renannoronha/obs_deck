import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/material/button.dart';
import 'package:obs_deck/material/button_pressed.dart';
import 'package:obs_deck/material/settings_page.dart';
import 'package:obs_deck/material/studio_mode_off.dart';
import 'package:obs_deck/material/studio_mode_on.dart';

class SwitcherPage extends StatelessWidget {
  final List<BoxShadow> blueBoxShadow = [
    BoxShadow(
        color: Color.fromRGBO(22, 22, 222, 1),
        offset: Offset(1.0, 1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
    BoxShadow(
        color: Color.fromRGBO(40, 40, 255, 1),
        offset: Offset(-1.0, -1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
  ];
  final List<Color> blueButton = [
    Color.fromRGBO(120, 120, 255, 1),
    Color.fromRGBO(100, 100, 255, 1),
    Color.fromRGBO(60, 60, 255, 1),
    // Color.fromRGBO(0, 0, 255, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('OBS Deck'),
            actions: [
              IconButton(
                icon: Icon(FontAwesomeIcons.cog),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Stream Time: ${state.switcherState.stats.streaming}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    ),
                    Text(
                      'CPU: ${state.switcherState.stats.cpuUsage}%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    ),
                    Text(
                      'FPS: ${state.switcherState.stats.fps}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    ),
                    Text(
                      'Upload: ${state.switcherState.stats.upload}Kb/s',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              state.settingsState.studioMode
                  ? StudioModeOn(state)
                  : StudioModeOff(state),
              Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sources',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 20),
                      )),
                  GridView.extent(
                    shrinkWrap: true,
                    maxCrossAxisExtent: 100,
                    padding:
                        EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                    children: state.switcherState.sourceList
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              // implement when possible to change source visibility through websocket
                              // if (!e.visible) StoreProvider.of<AppState>(context).dispatch(ToggleSourceAction(Source(e.name, !e.visible)));
                            },
                            child: e.visible
                                ? MyButtonPressed(
                                    text: e.name,
                                    boxShadow: this.blueBoxShadow,
                                    colors: this.blueButton)
                                : MyButton(theme: state.settingsState.theme, text: e.name, visible: e.visible),
                          ),
                        )
                        .toList(),
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
