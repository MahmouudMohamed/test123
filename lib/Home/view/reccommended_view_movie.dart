import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/Shared%20Widget/book_mark.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';
import 'package:test123/shimmer_card.dart';

import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class RecommendedViewMovie extends StatelessWidget {
  const RecommendedViewMovie({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getRecommendedMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is RecommendedLoadingState) {
            return ShimmerCard();
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
              height: MediaQuery.sizeOf(context).height * 0.36,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, FilmDetails.routeName,
                                arguments:
                                    cubit.recommendedModel?.results?[index].id??0);
                          },
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${cubit.recommendedModel?.results?[index].posterPath??""}",
                                fit: BoxFit.fill,
                                height: MediaQuery.sizeOf(context).height * 0.26,
                                width: MediaQuery.sizeOf(context).height * 0.19,
                                placeholder: (context, text) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                                BookMark(id: cubit.recommendedModel!.results![index].id!,)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            cubit.recommendedModel?.results?[index].originalTitle??"",
                            style: const TextStyle(color: Colors.white,fontSize: 15),
                          ),
                        ),
                        Center(
                          child: Text(
                            cubit.recommendedModel?.results?[index].releaseDate??""
                                .substring(0, 10),
                            style: const TextStyle(color: Colors.white,fontSize: 14),
                          ),
                        ),
                        CustomRate(vote: "${cubit.recommendedModel?.results?[index].voteAverage??""}".substring(0,3))
                      ],
                    ),
                  );
                },
                itemCount: cubit.recommendedModel?.results?.length??0,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );

  }
}
