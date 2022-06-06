import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/movie_card.dart';


class Movie {
  late final String poster_path, original_title, overview, release_date;
  late final List genre_ids;
  late final int id;
  late final num vote_average;

  Movie(this.id, this.original_title, this.release_date, this.vote_average, this.poster_path, this.overview,
      this.genre_ids);
}
