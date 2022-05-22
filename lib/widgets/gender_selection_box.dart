import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moodvicer/values.dart';

class GenderSelector extends StatefulWidget {
  final String genderAsset;
  String genderName;
  double? width;
  double? height;

  GenderSelector({Key? key, required this.genderAsset, required this.genderName, this.width, this.height})
      : super(key: key);

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 210,
        width: 210,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : AppColors.lightBlue,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.lightOrange,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Column(
                children: [
                  Image.asset(
                    widget.genderAsset,
                    width: widget.width,
                    height: widget.height,
                  ),
                  Text(
                    widget.genderName,
                    style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
