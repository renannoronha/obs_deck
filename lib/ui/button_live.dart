import 'package:flutter/material.dart';

class MyLiveButton extends StatelessWidget {
  final String text;

  MyLiveButton({
    Key key,
    this.text,
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
            fontSize: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(222, 22, 22, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
          // BoxShadow(color: Color.fromRGBO(255, 0, 0, 1), offset: Offset(1.0, 1.0), blurRadius: 7.0, spreadRadius: 1.0),
        ],
        gradient: RadialGradient(
          colors: [
            Color.fromRGBO(255, 120, 120, 1),
            Color.fromRGBO(255, 100, 100, 1),
            Color.fromRGBO(255, 60, 60, 1),
            Color.fromRGBO(255, 0, 0, 1),
          ],
        ),
      ),
    );
  }
}
