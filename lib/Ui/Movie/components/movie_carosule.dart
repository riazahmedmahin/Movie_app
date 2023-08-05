import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/movie_model.dart';


class MovieCarosel extends StatefulWidget {
  final List<MovieModel> movieModellist;

  const MovieCarosel({Key? key, required this.movieModellist})
      : super(key: key);

  @override
  State<MovieCarosel> createState() => _MovieCaroselState();
}

class _MovieCaroselState extends State<MovieCarosel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        CarouselSlider.builder(
            itemCount: widget.movieModellist.length,
            itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                InkWell(
                  onTap: () {

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: kmoviedbImageURL +
                          widget.movieModellist[itemIndex].posterPath.toString(),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              //viewportFraction: 0.1,
            )),
      ],
    );
  }
}