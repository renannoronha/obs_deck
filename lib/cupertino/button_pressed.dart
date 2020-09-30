import 'package:flutter/cupertino.dart';

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
          boxShadow: boxShadow,
          gradient: RadialGradient(
            colors: colors,
          ),
        ),
      ),
    );
  }
}
