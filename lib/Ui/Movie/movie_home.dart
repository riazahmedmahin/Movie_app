import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Movie/components/movie_carosule.dart';
import 'package:flutter_application_1/model/movie_model.dart';
import 'package:flutter_application_1/services/api_services.dart';

class Movie_Home extends StatefulWidget {
  const Movie_Home({super.key});

  @override
  State<Movie_Home> createState() => _Movie_HomeState();
}

class _Movie_HomeState extends State<Movie_Home> {

ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      children: [
        FutureBuilder(builder: (context,snapshot){
          if(snapshot.hasData){
            List<MovieModel> moviedata= snapshot.data ??[];
            return MovieCarosel(movieModellist: moviedata);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: apiService.getMovieData(MovieType.nowPlaying),
        )
      ],
     ),

    );
  }
}