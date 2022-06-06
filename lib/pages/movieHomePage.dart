import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moodvicer/api/movie_api.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/latest_movie_container.dart';
import 'package:moodvicer/widgets/voteStarShower.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../widgets/movie_card.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  late var movies2;
  List<String> genres = ["Sci-Fi", "Horror"];
  bool isMovie = true;

  List<Movie> movies = [];
  String imgPath = "https://image.tmdb.org/t/p/w500/";

  getMovieData() async {
    String? apiKey = dotenv.env['API_KEY'];
    String unencodedPath = "/3/movie/popular";
    Map<String, dynamic>? queryParameters = {"api_key": apiKey};
    var response = await http.get(Uri.https("api.themoviedb.org", unencodedPath, queryParameters));

    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      List<dynamic> results = jsonMap["results"];

      for (var maps in results) {
        Map<String, dynamic> movie = maps;

        Movie movie1 = Movie(movie["id"], movie["original_title"], movie["release_date"], movie["vote_average"],
            movie["poster_path"], movie["overview"], movie["genre_ids"]);
        movies.add(movie1);
      }
      print(movies.toString());
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    getMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Take a look to today's movies ",
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
                          movieIMDB_Point: movies[movies.length - 2].vote_average,
                          movieName: movies[movies.length - 2].original_title,
                          padding: EdgeInsets.all(12),
                          height: 200,
                          movieDuration: '120 minutes',
                          Moviegenres: genres,
                          moviePhoto: imgPath + movies[movies.length - 2].poster_path,
                        ),
                        SizedBox(
                          height: screenHeight / 2,
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 6 / 10,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: movies.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: MovieContainer(
                                    movieName: movies[index].original_title,
                                    movieYear: int.parse(movies[index].release_date.substring(0, 4)),
                                    imageUrl: imgPath + movies[index].poster_path,
                                    vote: movies[index].vote_average,
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
                                );
                              }),
                        ),
                      ],
                    )
                  : StarDisplay(avg: 5, size: 2)
            ],
          ),
        ),
      ),
    );
  }
}
