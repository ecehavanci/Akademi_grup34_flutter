import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';


class CommonContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double? radius;
  final Color? borderColor;

  const CommonContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      this.color: AppColors.white,
      required this.padding,
      this.radius: 5, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius!),
          color: color,
        ),
        child: child,
      ),
    );
  }
}

class CommonPressableContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double? radius;
  final void Function()? onTap;

  const CommonPressableContainer({Key? key, required this.width, required this.height, required this.child, this.color, required this.padding, this.radius :5, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}
