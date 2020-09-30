import 'package:flutter/material.dart';

class MyButtonPressed extends StatelessWidget {
  final String text;
  final List<BoxShadow> boxShadow;
  final List<Color> colors;

  MyButtonPressed({
    Key key,
    this.text,
    this.boxShadow,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(1),
      child: Container(
        child: Center(
          child: Text(
            this.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[300],
          boxShadow: boxShadow,
          gradient: RadialGradient(
            colors: colors,
          ),
        ),
      ),
    );
  }
}
