import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/browse/view/browse_details.dart';
import 'package:test123/browse/view/custom_browse.dart';
import 'package:test123/browse/view_model/category_cubit.dart';


class Browse extends StatelessWidget {
  static const String routeName = "b";

  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    List <String> images = [
      'assets/images/action.jpg',
      'assets/images/adventure.jpg',
      'assets/images/anime.jpg',
      'assets/images/comedy.jpg',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
      'assets/images/action.png',
    ];
    return BlocProvider(
      create: (context) => CategoryCubit()..getGenreMovies(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var category = CategoryCubit.get(context);
          if(state is GenreMovieLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              )
            );
          }
          if (state is GenreMovieErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if(state is GenreMovieSuccessState){
          return CustomBrowse();}
          return Container();
        },
      ),
    );
  }
}
