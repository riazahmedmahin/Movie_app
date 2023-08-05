
import 'dart:convert';

import 'package:flutter_application_1/constants/constants.dart';
import 'package:http/http.dart';

import '../model/movie_model.dart';

enum MovieType { nowPlaying, popular, topRated, upcoming, similar }

enum TvType { popular, topRated, onTheAir, airingTody, similar }

enum ProgramType { tv, movie }

class ApiService {
  Future<List<MovieModel>> getMovieData(MovieType type,
      {int movieID = 0}) async {
    String url = "";
    if (type == MovieType.popular) {
      url = kmoviedbURL + kpopular;
    } else if (type == MovieType.topRated) {
      url = kmoviedbURL + ktop_rated;
    } else if (type == MovieType.upcoming) {
      url = kmoviedbURL + kupcoming;
    } else if (type == MovieType.nowPlaying) {
      url = kmoviedbURL + knowPlaying;
    } else if (type == MovieType.similar) {
      url = kmoviedbURL + movieID.toString() + ksimilar;
    }
    try {
      Response response = await get(Uri.parse(
          url + "?api_key=99ac2298b20a80432c1d0f8618e51601&language=en-US"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['results'];
        List<MovieModel> movie =
            body.map((dynamic item) => MovieModel.fromJson(item)).toList();
        return movie;
      } else {
        throw ("No movie found");
      }
    } catch (e) {
      throw (e.toString());
    }


    
      }
}