import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import '../../Shared Widget/book_mark.dart';
import '../../Shared Widget/custom_rate.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class SimilarMovies extends StatelessWidget {
   SimilarMovies({super.key});
  @override
  Widget build(BuildContext context) {
    String path="https://image.tmdb.org/t/p/w500";
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return  BlocProvider(
      create: (context) => HomeCubit()..getSimilarMovieDetails(id),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is SimilarMoviesLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ));
          }
          if (state is SimilarMoviesErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "Error Occurred",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }

          if (state is SimilarMoviesSuccessState) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.34,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, FilmDetails.routeName,
                              arguments:
                              cubit.similarMoviesModel!.results![index].id);
                        },
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "$path${cubit.similarMoviesModel?.results?[index].posterPath??""}",
                              fit: BoxFit.fill,
                              height: MediaQuery.sizeOf(context).height * 0.24,
                              width: 140,
                              placeholder: (context, text) => const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.yellow,
                                  )),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                            const BookMark()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            cubit.similarMoviesModel!.results![index].originalTitle??"",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        cubit.similarMoviesModel!.results![index].releaseDate!
                            .substring(0, 10),
                        style: const TextStyle(color: Colors.white),
                      ),
                      CustomRate(vote: "${cubit.similarMoviesModel!.results![index].voteAverage}")
                    ],
                  );
                },
                itemCount: cubit.similarMoviesModel!.results!.length??0,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
