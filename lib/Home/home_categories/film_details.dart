import 'package:flutter/material.dart';
import 'package:test123/Home/view/movie_det.dart';


class FilmDetails extends StatelessWidget {
  static const String routeName = "FilmDetails";

  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: MovieDet());
  }
}
