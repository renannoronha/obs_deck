import 'package:flutter/material.dart';
import 'package:obs_deck/themes.dart';

class MyButton extends StatelessWidget {
  final String theme;
  final String text;
  final bool visible;

  MyButton({
    Key key,
    this.theme,
    this.text,
    this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(1),
      child: Center(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
        boxShadow: this.visible ? Themes().getActiveShadow(theme) : Themes().getInactiveShadow(theme),
        gradient: RadialGradient(
          colors: this.visible ? Themes().getActiveButton(theme) : Themes().getInactiveButton(theme),
          stops: [0, 1],
        ),
      ),
    );
  }
}
