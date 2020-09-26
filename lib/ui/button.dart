import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool visible;

  final List<BoxShadow> activeShadow = [
    BoxShadow(color: Colors.grey[400], offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Colors.yellow[50], offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<BoxShadow> inactiveShadow = [
    BoxShadow(color: Colors.grey[600], offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
    BoxShadow(color: Colors.white, offset: Offset(-1.0, -1.0), blurRadius: 7.0, spreadRadius: 1.0),
  ];
  final List<Color> activeButton = [
    Colors.yellow[50],
    Color.fromRGBO(255, 251, 215, 1),
  ];
  final List<Color> inactiveButton = [
    Colors.grey[50],
    Colors.grey[50],
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
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
        boxShadow: this.visible ? this.activeShadow : this.inactiveShadow,
        gradient: RadialGradient(
          colors: this.visible ? this.activeButton : this.inactiveButton,
          stops: [0, 1],
        ),
      ),
    );
  }
}
