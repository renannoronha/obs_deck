import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';
import 'package:obs_deck/cupertino/button.dart';
import 'package:obs_deck/cupertino/button_live.dart';
import 'package:obs_deck/cupertino/button_pressed.dart';
import 'package:obs_deck/themes.dart';

class StudioModeOff extends StatelessWidget {
  final AppState state;

  StudioModeOff(this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 70,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Program',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20),
                ),
              ),
              GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 120,
                padding: EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                children: state.switcherState.programList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          if (!e.active) StoreProvider.of<AppState>(context).dispatch(ToggleProgramAction(e));
                        },
                        child: e.active
                            ? MyButtonPressed(text: e.name, boxShadow: Themes().getRedShadow(state.settingsState.theme), colors: Themes().getRedButton(state.settingsState.theme))
                            : MyButton(theme: state.settingsState.theme, text: e.name, visible: true),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 30,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Transition',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20),
                ),
              ),
              GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 100,
                padding: EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                children: [
                      GestureDetector(
                        onTap: () {
                          var transition = state.switcherState.transitionList.firstWhere((element) => element.active);
                          StoreProvider.of<AppState>(context).dispatch(ChangeSceneAction(transition));
                        },
                        child: MyLiveButton(text: 'LIVE'),
                      ),
                      Container(),
                      Container(),
                    ] +
                    state.switcherState.transitionList
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              if (!e.active) StoreProvider.of<AppState>(context).dispatch(ToggleTransitionAction(e));
                            },
                            child: e.active
                                ? MyButtonPressed(
                                    text: e.name, boxShadow: Themes().getYellowShadow(state.settingsState.theme), colors: Themes().getYellowButton(state.settingsState.theme))
                                : MyButton(theme: state.settingsState.theme, text: e.name, visible: true),
                          ),
                        )
                        .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
