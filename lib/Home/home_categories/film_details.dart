import 'package:flutter/material.dart';
import 'package:test123/Home/view/similar_movies.dart';
import 'package:test123/search/movie_det.dart';

import '../view/row_category.dart';

class FilmDetails extends StatelessWidget {
  static const String routeName = "FilmDetails";
   FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox( height: MediaQuery.sizeOf(context).height * 0.66,child: MovieDet()),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
              padding: EdgeInsets.all(20),
              color: Color(0xff282A28),
              child: Column(
                children: [
                  RowCategory(left: "Recommended"),
                  SizedBox(height: 15,),
                  SimilarMovies(),
                ],
              ),
            )
          ],
        ),
      )

    );
  }
}
