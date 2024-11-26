import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize, height;
  final FontWeight? fontWeight;

  const AppText(this.text,
      {super.key, this.color, this.fontSize, this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.bold,
        height: height,
      ),
    );
  }
}
