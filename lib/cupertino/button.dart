import 'package:flutter/cupertino.dart';
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
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            this.text.replaceAll(' ', '\n'),
            maxLines: 5,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: CupertinoColors.systemGrey,
        boxShadow: this.visible ? Themes().getActiveShadow(theme) : Themes().getInactiveShadow(theme),
        gradient: RadialGradient(
          colors: this.visible ? Themes().getActiveButton(theme) : Themes().getInactiveButton(theme),
          stops: [0, 1],
        ),
      ),
    );
  }
}
