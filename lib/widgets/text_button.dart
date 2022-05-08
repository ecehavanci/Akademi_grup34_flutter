import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? paddingValue;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.paddingValue: 5,
      this.fontSize,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(paddingValue!),
        textStyle: TextStyle(fontSize: fontSize, fontFamily: "Comfortaa"),
      ),
    );
  }
}
