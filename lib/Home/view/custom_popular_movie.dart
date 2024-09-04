import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test123/Home/home_categories/film_details.dart';

import 'package:test123/Shared%20Widget/book_mark.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';
import 'package:test123/search/movie_det.dart';

import '../model/PopularMoviesModel.dart';

class CustomPopularMovie extends StatelessWidget {
  Results? popularIndex;

  CustomPopularMovie({required this.popularIndex}); // Results results;

  // CustomPopularMovie({required this.results, super.key});

  // bool checkMark = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://image.tmdb.org/t/p/w500${popularIndex?.backdropPath ?? ""}",
            fit: BoxFit.cover,
            placeholder: (context, text) => CircularProgressIndicator(
              color: Colors.yellow,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            top: 95,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          FilmDetails.routeName,
                          arguments: popularIndex?.id,
                        );
                      },
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${popularIndex?.posterPath ?? ""}",
                            height: 220,
                            placeholder: (context, text) => Center(
                                child: CircularProgressIndicator(
                              color: Colors.yellow,
                            )),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          BookMark()
                        ],
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              "${popularIndex?.originalTitle ?? ""}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${popularIndex?.releaseDate ?? ""}",
                            style: TextStyle(color: Colors.white),
                          ),
                         CustomRate(vote: "${popularIndex?.voteAverage ?? ""}")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
