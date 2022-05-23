import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieApi extends StatefulWidget {
  const MovieApi({Key? key}) : super(key: key);

  @override
  State<MovieApi> createState() => _MovieApiState();
}

class _MovieApiState extends State<MovieApi> {
  getMovieData() async {
    String? apiKey = dotenv.env['API_KEY'];
    String unencodedPath = "/3/movie/popular";
    Map<String, dynamic>? queryParameters = {"api_key": apiKey};
    var response = await http.get(Uri.https("api.themoviedb.org", unencodedPath, queryParameters));

    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      List<dynamic> results = jsonMap["results"];
      List<Movie> movies = [];

      for (var maps in results) {
        Map<String, dynamic> movie = maps;

        Movie movie1 = Movie(movie["id"], movie["original_title"], movie["release_date"], movie["vote_average"],
            movie["poster_path"], movie["overview"], movie["genre_ids"]);
        movies.add(movie1);
      }
      print(movies.toString());
      return movies;
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
    return Container();
  }
}

class Movie {
  late final String poster_path, original_title, overview, release_date;
  late final List genre_ids;
  late final int id;
  late final num vote_average;

  Movie(this.id, this.original_title, this.release_date, this.vote_average, this.poster_path, this.overview,
      this.genre_ids);
}
