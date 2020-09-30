import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool visible;

  final List<BoxShadow> activeShadow = [
    BoxShadow(color: CupertinoColors.systemGrey4, offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: Color.fromRGBO(255, 255, 200, 1), offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadow = [
    BoxShadow(color: CupertinoColors.systemGrey4, offset: Offset(1.0, 1.0), blurRadius: 4.0, spreadRadius: 1.0),
    BoxShadow(color: CupertinoColors.systemGrey5, offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButton = [
    Color.fromRGBO(255, 255, 210, 1),
    Color.fromRGBO(255, 251, 230, 1),
  ];
  final List<Color> inactiveButton = [
    CupertinoColors.systemGrey5,
    CupertinoColors.systemGrey6,
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
