import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';
import 'package:obs_deck/material/button.dart';
import 'package:obs_deck/material/button_live.dart';
import 'package:obs_deck/material/button_pressed.dart';
import 'package:obs_deck/themes.dart';

class StudioModeOn extends StatelessWidget {
  final AppState state;

  StudioModeOn(this.state);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 40,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Preview',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20),
                ),
              ),
              GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 100,
                padding: EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                children: state.switcherState.previewList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          if (!e.active) StoreProvider.of<AppState>(context).dispatch(TogglePreviewAction(e));
                        },
                        child: e.active
                            ? MyButtonPressed(
                                text: e.name,
                                boxShadow: Themes().getGreenShadow(state.settingsState.theme),
                                colors: Themes().getGreenButton(state.settingsState.theme),
                              )
                            : MyButton(theme: state.settingsState.theme, text: e.name, visible: true),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 20,
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
                      Container()
                    ] +
                    state.switcherState.transitionList
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              if (!e.active) StoreProvider.of<AppState>(context).dispatch(ToggleTransitionAction(e));
                            },
                            child: e.active
                                ? MyButtonPressed(
                                    text: e.name,
                                    boxShadow: Themes().getYellowShadow(state.settingsState.theme),
                                    colors: Themes().getYellowButton(state.settingsState.theme),
                                  )
                                : MyButton(theme: state.settingsState.theme, text: e.name, visible: true),
                          ),
                        )
                        .toList(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 40,
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
                maxCrossAxisExtent: 100,
                padding: EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                children: state.switcherState.programList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          if (!e.active) StoreProvider.of<AppState>(context).dispatch(ToggleProgramAction(e));
                        },
                        child: e.active
                            ? MyButtonPressed(
                                text: e.name,
                                boxShadow: Themes().getRedShadow(state.settingsState.theme),
                                colors: Themes().getRedButton(state.settingsState.theme),
                              )
                            : MyButton(theme: state.settingsState.theme, text: e.name, visible: true),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
