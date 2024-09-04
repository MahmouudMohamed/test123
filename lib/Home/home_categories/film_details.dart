import 'package:flutter/material.dart';
import 'package:test123/Home/view/similar_movies.dart';
import 'package:test123/Home/view/movie_det.dart';

import '../../Shared Widget/row_category.dart';

class FilmDetails extends StatelessWidget {
  static const String routeName = "FilmDetails";

  FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MovieDet());
  }
}
