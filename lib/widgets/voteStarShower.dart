import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';

class StarDisplay extends StatelessWidget {
  StarDisplay({Key? key, required this.avg, required this.size}) : super(key: key);
  final double avg;
  final double size;

  final fiveStars = Row(
    children: [
  Icon(
    Icons.star,
    color: Colors.red,
    size: 2,
  ),
  Icon(
    Icons.star,
    color: Colors.red,
    size: 2,
  ),
  Icon(
    Icons.star,
    color: Colors.red,
    size: 2,
  ),
  Icon(
    Icons.star,
    color: Colors.red,
    size: 2,
  ),
  Icon(
    Icons.star,
    color: Colors.red,
    size: 2,
  ),
    ],
  );
  final fourStars = Container(
      child: Row(
    children: [
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2,
      ),
    ],
  ));
  final threeStars = Container(
      child: Row(
    children: [
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2,
      ),
    ],
  ));
  final twoStars = Container(
      child: Row(
    children: [
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
    ],
  ));

  final oneStar = Container(
      child: Row(
    children: [
      Icon(
        Icons.star,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
    ],
  ));

  final zeroStar = Container(
      child: Row(
    children: [
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
      Icon(
        Icons.star_outline,
        color: Colors.red,
        size: 2
        ,
      ),
    ],
  ));

  displayStars() {
    if (avg < 1)
      return zeroStar;
    else if (avg == 1)
      return oneStar;
    else if (avg > 1 && avg <= 2)
      return twoStars;
    else if (avg > 2 && avg <= 3)
      return threeStars;
    else if (avg > 3 && avg <= 4)
      return fourStars;
    else if (avg > 4 && avg <= 5) return fiveStars;
  }

  @override
  Widget build(BuildContext context) {
    return displayStars();
  }
}
