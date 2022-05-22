import 'package:flutter/material.dart';

class CustomLogButton extends StatelessWidget {
  final String text;
  final double? fontsize;
  final void Function()? onPressed;
  final Color? primaryColor;

  const CustomLogButton({
    Key? key,
    this.fontsize,
    required this.text,
    this.onPressed,
    this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontsize, fontFamily: "Comfortaa"),
      ),
    );
  }
}

class CustomImageButton extends StatelessWidget {
  final String text;
  final double? fontsize;
  final String imagePath;
  final double ImageHeight;
  final double ImageWidth;

  final void Function()? onPressed;

  const CustomImageButton({
    Key? key,
    required this.text,
    this.fontsize,
    required this.imagePath,
    required this.ImageHeight,
    required this.ImageWidth,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            width: ImageWidth,
            height: ImageHeight,
            fit: BoxFit.cover,
          ),
          Text(
            text,
            style: TextStyle(fontSize: fontsize, fontFamily: "Comfortaa"),
          ),
          Opacity(
              opacity: 0,
              child: Image.asset(
                imagePath,
                width: ImageWidth,
                height: ImageHeight,
              )),
        ],
      ),
    );
  }
}
