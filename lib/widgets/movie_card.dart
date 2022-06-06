import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/shaped_container.dart';
import 'package:moodvicer/widgets/voteStarShower.dart';

class MovieContainer extends StatelessWidget {
  final String imageUrl;
  final String movieName;
  final int movieYear;
  final num vote;
  final void Function()? onTap;

  const MovieContainer(
      {Key? key,
      required this.imageUrl,
      required this.movieName,
      required this.movieYear,
      this.onTap,
      required this.vote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth / 3,
                      child: Text(
                        movieName,
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "( " + movieYear.toString() + " )",
                    style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            vote.toString(),
                            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w800, fontSize: 15),
                          ),
                        )
                        /*CommonContainer(
                            borderColor: AppColors.white,
                            radius: 60,
                            width: screenWidth / 6,
                            height: screenHeight / 30,
                            child: Text(
                              "Sci-Fi",
                              style: TextStyle(color: AppColors.kblue, fontWeight: FontWeight.w400, fontSize: 15),
                              overflow: TextOverflow.fade,
                            ),
                            padding: EdgeInsets.all(2))*/
                        //StarDisplay(avg: double.parse(vote.toString()), size: 2)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
