import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/latest_movie_container.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../widgets/movie_card.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  //these lines are just for testing
  List<String> genres = ["Sci-Fi", "Horror"];
  bool isMovie = true;

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
                      setState(() {
                        isMovie = !isMovie;
                      });
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
              isMovie
                  ? Column(
                      children: [
                        LatestMovieContainer(
                          radius: 25,
                          width: screenWidth / 1.8,
                          movieIMDB_Point: 12,
                          movieName: 'movieName',
                          padding: EdgeInsets.all(12),
                          height: 200,
                          movieDuration: '120 minutes',
                          Moviegenres: genres,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          primary: false,
                          childAspectRatio: 6 / 10,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 3,
                          crossAxisCount: 2,
                          children: <Widget>[
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                            MovieContainer(
                              imageUrl:
                                  'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg',
                              movieName: 'Star Wars',
                              movieYear: 2020,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Text("data")
            ],
          ),
        ),
      ),
    );
  }
}
