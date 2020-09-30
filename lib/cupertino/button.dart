import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool visible;

  final List<BoxShadow> activeShadow = [
    BoxShadow(color: CupertinoColors.systemGrey, offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: CupertinoColors.systemYellow, offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadow = [
    BoxShadow(color: CupertinoColors.systemGrey, offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: CupertinoColors.white, offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButton = [
    CupertinoColors.systemYellow,
    Color.fromRGBO(255, 251, 215, 1),
  ];
  final List<Color> inactiveButton = [
    CupertinoColors.systemGrey,
    CupertinoColors.systemGrey,
  ];

  MyButton({
    Key key,
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
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: CupertinoColors.systemGrey,
        boxShadow: this.visible ? this.activeShadow : this.inactiveShadow,
        gradient: RadialGradient(
          colors: this.visible ? this.activeButton : this.inactiveButton,
          stops: [0, 1],
        ),
      ),
    );
  }
}
