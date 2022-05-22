import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/latest_movie_container.dart';
import 'package:rolling_switch/rolling_switch.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  //these lines are just for testing
  List<String> genres = ["Sci-Fi", "Horror"];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Hello userName",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 20),
        ),
        backgroundColor: AppColors.grayDark,
      ),
      body: Container(
        color: AppColors.grayDark,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: RollingSwitch.widget(
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'on' : 'off'}');
                    },
                    rollingInfoLeft: const RollingWidgetInfo(
                      backgroundColor: AppColors.lightOrange2,
                      icon: Icon(Icons.movie),
                      text: Text(
                        'Movie',
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    rollingInfoRight: const RollingWidgetInfo(
                      backgroundColor: AppColors.lightBlue,
                      icon: Icon(Icons.music_note),
                      text: Text('Music',
                          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                    ),
                  ),
                ),
              ),
              LatestMovieContainer(
                radius: 25,
                width: screenWidth / 1.8,
                movieIMDB_Point: 12,
                movieName: 'movieName',
                padding: EdgeInsets.all(12),
                height: 200,
                movieDuration: '120 minutes',
                Moviegenres: genres,
              )
            ],
          ),
        ),
      ),
    );
  }
}
