import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/shaped_container.dart';

class MovieLabel extends StatelessWidget {
  final String movieGenre;

  const MovieLabel({Key? key, required this.movieGenre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color:Colors.transparent,
      padding: EdgeInsets.all(8),
      width: 45,
      height: 20,
      radius: 40,
      child: Text(
        movieGenre,
        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 15),
      ),
    );
  }
}
