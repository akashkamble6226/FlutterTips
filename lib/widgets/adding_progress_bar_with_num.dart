import 'package:flutter/material.dart';

class NumberCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final TextStyle? textStyle;

  const NumberCircularProgressIndicator(
      {Key? key,
      this.textStyle,
      required this.progress,
      required this.width,
      required this.height})
      : super(key: key);

  TextStyle get style => textStyle ?? const TextStyle(fontSize: 30.0);
  int get _progress => (progress * 100.0).toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '$_progress%',
            style: style,
          ),
          SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white70,
                value: progress,
                color: Colors.blueAccent,
                strokeWidth: 3.0,
              ))
        ],
      ),
    );
  }
}
