import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/view_model/home_cuibt.dart';
import '../Home/view_model/home_state.dart';



class MovieDet extends StatelessWidget {
  MovieDet({super.key});

  static const String routeName = "de";

  @override
  Widget build(BuildContext context) {
    String path="https://image.tmdb.org/t/p/w500";
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getMovieDetails(id)
      // ..getSimilarMovieDetails(id),
     , child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is MovieDetailsLoadingState || state is SimilarMoviesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
          if (state is MovieDetailsErrorState || state is SimilarMoviesErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "Some Error Occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          if(state is MovieDetailsSuccessState || state is SimilarMoviesSuccessState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff1D1E1D),
              title: Text("${cubit.movieDetailsModel?.title}",style: TextStyle(color: Colors.white),),
            ),
            body: Column(
              children: [
                cubit.movieDetailsModel == null
                    ? const SizedBox.shrink()
                    : CachedNetworkImage(
                        imageUrl:
                        cubit.movieDetailsModel?.backdropPath==null?"":
                            '$path${cubit.movieDetailsModel?.backdropPath??""}',
                        fit: BoxFit.fill,
                        height: 250,
                        width: double.infinity,
                        placeholder: (context, text) => const Center(
                            child: CircularProgressIndicator(
                          color: Colors.yellow,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                Text(
                  cubit.movieDetailsModel?.overview ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${cubit.movieDetailsModel?.voteAverage}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${cubit.movieDetailsModel?.releaseDate}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${cubit.movieDetailsModel?.title}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Wrap(
                  children: List.generate(
                    cubit.movieDetailsModel?.genres?.length ?? 0,
                    (index) => Text(
                      "${cubit.movieDetailsModel?.genres?[index].name} | ",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Wrap(
                //   children: List.generate(
                //     cubit.similarMoviesModel?.results?.length ?? 0,
                //         (index) => Text(
                //           '${cubit.similarMoviesModel?.results?[index].title} || ' ?? "",
                //           style: const TextStyle(color: Colors.white),
                //         ),
                //   ),
                // ),

              ],
            ),
          );}
          return Container();
        },
      ),
    );
  }
}
