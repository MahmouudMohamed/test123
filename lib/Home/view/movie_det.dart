import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';

import '../../Shared Widget/row_category.dart';
import 'similar_movies.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';
import '../../Shared Widget/category_chip.dart';
import '../../const.dart';

class MovieDet extends StatelessWidget {
  MovieDet({super.key});

  static const String routeName = "de";

  @override
  Widget build(BuildContext context) {
    String path = "https://image.tmdb.org/t/p/w500";
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getMovieDetails(id)
        ..getSimilarMovieDetails(id),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is MovieDetailsLoadingState || state is SimilarMoviesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
          if (state is MovieDetailsErrorState ||
              state is SimilarMoviesErrorState) {
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
          if (state is MovieDetailsSuccessState || state is SimilarMoviesSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "${cubit.movieDetailsModel?.title}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // cubit.movieDetailsModel == null
                    //     ? const SizedBox.shrink()
                    //     :
                    CachedNetworkImage(
                      imageUrl: cubit.movieDetailsModel?.backdropPath == null
                          ? Const.wrongImageBack
                          : '$path${cubit.movieDetailsModel?.backdropPath ?? ""}',
                      fit: BoxFit.fill,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: double.infinity,
                      placeholder: (context, text) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.yellow,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "${cubit.movieDetailsModel?.title}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.001),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "${cubit.movieDetailsModel?.releaseDate}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: CachedNetworkImage(
                                imageUrl: cubit.movieDetailsModel?.posterPath ==null
                                    ? Const.wrongImagePoster
                                    : '$path${cubit.movieDetailsModel?.posterPath}',
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                placeholder: (context, text) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).height * 0.01,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 30,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                    itemCount: cubit.movieDetailsModel?.genres
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) =>
                                        CategoryChip(
                                            text: cubit.movieDetailsModel
                                                    ?.genres?[index].name ??
                                                ""),
                                  ),
                                  SizedBox(height: 10,),
                                  Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 9,
                                      "${cubit.movieDetailsModel?.overview ?? ""}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  CustomRate(
                                      vote:
                                          "${cubit.movieDetailsModel?.voteAverage}"
                                              .substring(0, 3))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.02,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          color: Color(0xff282A28),
                          child: Column(
                            children: [
                              RowCategory(left: "More Like This"),
                              SizedBox(
                                height: 15,
                              ),
                              SimilarMovies()
                            ],
                          ),
                        )

                        // SimilarMovies(),
                      ],
                    ),
                    // Text(
                    //   cubit.movieDetailsModel?.overview ?? "",
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Text(
                    //   "${cubit.movieDetailsModel?.voteAverage}",
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // ),
                
                    // Wrap(
                    //   children: List.generate(
                    //     cubit.movieDetailsModel?.genres?.length ?? 0,
                    //     (index) => Text(
                    //       "${cubit.movieDetailsModel?.genres?[index].name} | ",
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                
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
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
