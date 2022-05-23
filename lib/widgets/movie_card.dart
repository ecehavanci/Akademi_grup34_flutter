import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final String movieName;
  final int movieYear;
  final void Function()? onTap;

  const MovieContainer({Key? key, required this.imageUrl, required this.movieName, required this.movieYear, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0),
      child: Column(
        children: [
          Card(
            elevation: 1.5,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: onTap,
              child: Image.network(imageUrl, width: 150, height: 200, errorBuilder: (context, error, stackTrace) {
                print(error);
                return const CircularProgressIndicator();
              }),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movieName,
                  style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ),
              Text(
                "( " + movieYear.toString() + " )",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
