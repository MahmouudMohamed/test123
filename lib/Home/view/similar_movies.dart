import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/const.dart';
import '../../Shared Widget/book_mark.dart';
import '../../Shared Widget/custom_rate.dart';
import '../../Shared Widget/row_category.dart';
import '../../shimmer_card.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    String path = "https://image.tmdb.org/t/p/w500";
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) => HomeCubit()..getSimilarMovieDetails(id),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is SimilarMoviesLoadingState) {
            return ShimmerCard();
          }
          if (state is SimilarMoviesErrorState) {
            return const Center(
              child: Column(
                children: [
                  Text(
                    "Error Occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }

          if (state is SimilarMoviesSuccessState) {
            if (cubit.similarMoviesModel?.results?.isEmpty == true) {
              return const Center(
                  child: Text(
                "No Similar Movies Found",
                style: TextStyle(color: Colors.white),
              ));
            }
            return Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xff282A28),
              child: Column(children: [
                RowCategory(left: "More Like This"),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.36,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, FilmDetails.routeName,
                                    arguments: cubit.similarMoviesModel!
                                        .results![index].id);
                              },
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: cubit.similarMoviesModel
                                                ?.results?[index].posterPath ==
                                            null
                                        ? Const.wrongImagePoster
                                        : "$path${cubit.similarMoviesModel?.results?[index].posterPath}",
                                    fit: BoxFit.fill,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.26,
                                    width: MediaQuery.sizeOf(context).height *
                                        0.19,
                                    placeholder: (context, text) =>
                                        const Center(
                                            child: CircularProgressIndicator(
                                      color: Colors.yellow,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                   BookMark()
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Center(
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  cubit.similarMoviesModel!.results![index]
                                          .originalTitle ??
                                      "",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                            Text(
                              cubit.similarMoviesModel?.results?[index]
                                      .releaseDate ??
                                  "".substring(0, 10),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            CustomRate(
                                vote:
                                    "${cubit.similarMoviesModel!.results![index].voteAverage}"
                                        .substring(0, 3))
                          ],
                        ),
                      );
                    },
                    itemCount: cubit.similarMoviesModel?.results?.length ?? 0,
                  ),
                ),
              ]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
