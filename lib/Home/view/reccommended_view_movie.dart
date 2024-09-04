import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/Shared%20Widget/book_mark.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';
import 'package:test123/search/movie_det.dart';

import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class RecommendedViewMovie extends StatelessWidget {
  RecommendedViewMovie({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getRecommendedMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is RecommendedLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ));
          }
          if (state is RecommendedErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "${state.errorMes}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }

          if (state is RecommendedSuccessState) {
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
                          Navigator.pushNamed(context, FilmDetails.routeName,
                              arguments:
                                  cubit.recommendedModel!.results![index].id);
                        },
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w500${cubit.recommendedModel!.results![index].posterPath!}",
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
                            cubit.recommendedModel?.results![index].originalTitle??"",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        cubit.recommendedModel!.results![index].releaseDate!
                            .substring(0, 10),
                        style: const TextStyle(color: Colors.white),
                      ),
                      CustomRate(vote: "${cubit.recommendedModel!.results![index].voteAverage}")
                    ],
                  );
                },
                itemCount: cubit.recommendedModel!.results!.length,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );

// Image.network("https://image.tmdb.org/t/p/w500${cubit.newReleaseModel!.results![index].posterPath!}",
// CachedNetworkImage(
//             imageUrl: posterBack,fit: BoxFit.cover,
//             placeholder: (context, text) =>
//                 CircularProgressIndicator(color: Colors.yellow,),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           ),

    //   SizedBox(
    //   height: MediaQuery.sizeOf(context).height * 0.25,
    //   child: ListView.separated(
    //     separatorBuilder: (context, index) => SizedBox(width: 15,),
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return Column(
    //         children: [
    //           InkWell(
    //             onTap: () {},
    //             child: Stack(
    //               children: [
    //                 Image.asset(image[index],
    //                     height: MediaQuery.sizeOf(context).height * 0.25,
    //                     width: 130,
    //                     fit: BoxFit.fill),
    //                 BookMark()
    //
    //               ],
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //     itemCount: image.length,
    //   ),
    // );
  }
}
