import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? primaryColor;
  final double? fontsize;
  final double? width;
  final double? height;

  const LongButton({Key? key, required this.text, this.primaryColor, this.onPressed, this.fontsize, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: fontsize),
        ),
      ),
    );
  }
}
