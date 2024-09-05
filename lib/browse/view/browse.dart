import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/browse/view/browse_details.dart';
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
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Browse Category",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 120),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, BrowseDetails.routeName,
                            arguments: category.genresModel?.genres?[index],);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: 180,
                            height: 110,
                          ),
                          Text(
                            category.genresModel?.genres?[index].name ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount:category.genresModel?.genres?.length??0,
                ),
              ],
            ),
          );}
          return Container();
        },
      ),
    );
  }
}
