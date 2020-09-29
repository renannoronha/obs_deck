import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:obs_deck/redux/app/app_state.dart';
import 'package:obs_deck/redux/switcher/switcher_actions.dart';
import 'package:obs_deck/cupertino/button.dart';
import 'package:obs_deck/cupertino/button_live.dart';
import 'package:obs_deck/cupertino/button_pressed.dart';

class StudioModeOn extends StatelessWidget {
  final List<BoxShadow> greenBoxShadow = [
    BoxShadow(
        color: Color.fromRGBO(22, 222, 22, 1),
        offset: Offset(1.0, 1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
    BoxShadow(
        color: Color.fromRGBO(0, 255, 0, 1),
        offset: Offset(-1.0, -1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
  ];
  final List<Color> greenButton = [
    Color.fromRGBO(120, 255, 120, 1),
    Color.fromRGBO(100, 255, 100, 1),
    Color.fromRGBO(60, 255, 60, 1),
    Color.fromRGBO(0, 255, 0, 1),
  ];

  final List<BoxShadow> yellowBoxShadow = [
    BoxShadow(
        color: Color.fromRGBO(222, 222, 0, 1),
        offset: Offset(1.0, 1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
    BoxShadow(
        color: Color.fromRGBO(255, 255, 0, 1),
        offset: Offset(-1.0, -1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
  ];
  final List<Color> yellowButton = [
    Color.fromRGBO(255, 255, 120, 1),
    Color.fromRGBO(255, 255, 100, 1),
    Color.fromRGBO(255, 255, 60, 1),
    Color.fromRGBO(255, 255, 0, 1),
  ];

  final List<BoxShadow> redBoxShadow = [
    BoxShadow(
        color: Color.fromRGBO(222, 22, 22, 1),
        offset: Offset(1.0, 1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
    BoxShadow(
        color: Color.fromRGBO(255, 0, 0, 1),
        offset: Offset(-1.0, -1.0),
        blurRadius: 7.0,
        spreadRadius: 1.0),
  ];
  final List<Color> redButton = [
    Color.fromRGBO(255, 120, 120, 1),
    Color.fromRGBO(255, 100, 100, 1),
    Color.fromRGBO(255, 60, 60, 1),
    Color.fromRGBO(255, 0, 0, 1),
  ];
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 20),
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
                          if (!e.active)
                            StoreProvider.of<AppState>(context)
                                .dispatch(TogglePreviewAction(e));
                        },
                        child: e.active
                            ? MyButtonPressed(
                                text: e.name,
                                boxShadow: this.greenBoxShadow,
                                colors: this.greenButton)
                            : MyButton(text: e.name, visible: true),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 20),
                ),
              ),
              GridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 100,
                padding: EdgeInsets.only(top: 30, bottom: 5, left: 5, right: 5),
                children: [
                      GestureDetector(
                        onTap: () {
                          var transition = state.switcherState.transitionList
                              .firstWhere((element) => element.active);
                          StoreProvider.of<AppState>(context)
                              .dispatch(ChangeSceneAction(transition));
                        },
                        child: MyLiveButton(text: 'LIVE'),
                      ),
                      Container()
                    ] +
                    state.switcherState.transitionList
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              if (!e.active)
                                StoreProvider.of<AppState>(context)
                                    .dispatch(ToggleTransitionAction(e));
                            },
                            child: e.active
                                ? MyButtonPressed(
                                    text: e.name,
                                    boxShadow: this.yellowBoxShadow,
                                    colors: this.yellowButton)
                                : MyButton(text: e.name, visible: true),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 20),
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
                          if (!e.active)
                            StoreProvider.of<AppState>(context)
                                .dispatch(ToggleProgramAction(e));
                        },
                        child: e.active
                            ? MyButtonPressed(
                                text: e.name,
                                boxShadow: this.redBoxShadow,
                                colors: this.redButton)
                            : MyButton(text: e.name, visible: true),
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
