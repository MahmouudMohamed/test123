import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';
import 'package:test123/browse/view/browse_details.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Shared Widget/row_category.dart';
import 'similar_movies.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';
import '../../Shared Widget/category_chip.dart';
import '../../const.dart';

class MovieDet extends StatelessWidget {
  const MovieDet({super.key});

  static const String routeName = "de";

  @override
  Widget build(BuildContext context) {
    String path = "https://image.tmdb.org/t/p/w500";
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getMovieDetails(id)
        ..getSimilarMovieDetails(id)
        ..getVideoMovie(id)
      ,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is MovieDetailsLoadingState|| state is SimilarMoviesLoadingState||state is VideoMovieLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
          if (state is MovieDetailsErrorState || state is SimilarMoviesErrorState || state is VideoMovieErrorState) {
            return const Center(
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
          if (state is MovieDetailsSuccessState|| state is SimilarMoviesSuccessState || state is VideoMovieSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "${cubit.movieDetailsModel?.title}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // cubit.movieDetailsModel == null
                    //     ? const SizedBox.shrink()
                    //     :
                    Stack(
                      children: [
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
                        IconButton(onPressed: (){
                          showDialog(context: context, builder: (context) {
                             return AlertDialog(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            content:  SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.3,
                              width: 150,
                              child: ListView.separated(
                                shrinkWrap:true,
                                itemBuilder: (context, index) =>   TextButton(onPressed: ()
                                {
                                  print('print ${cubit.videoModel?.results?[index].id}');
                                  Uri uri = Uri.parse(
                                      'https://www.youtube.com/watch?v=${cubit.videoModel?.results?[index].key}??" "'
                                  );
                                  launchUrl(uri);
                                  Navigator.pop(context);
                                }
                                  , child:  Center(
                                    child: Text(cubit.videoModel?.results?[index]==null?'No trailer':'Trailer${index+1}',
                                      style: const TextStyle(
                                        fontSize: 25,color: Colors.red
                                    ),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                itemCount: cubit.videoModel?.results?.length??0,
                              ),
                            ),
                          );});
                          // Uri uri = Uri.parse(
                          //     'https://www.youtube.com/watch?v=${cubit.videoModel?.results?[0].key}??" "'
                          // );
                          // launchUrl(uri);

                        }, icon: const Text("Watch movie",style: TextStyle(color: Colors.white),))
                      ],
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
                                  // Wrap(
                                  //   children: cubit.movieDetailsModel?.genres?.map((genre) {
                                  //     return CategoryChip(text: genre.name ?? '');
                                  //   }).toList() ?? [],
                                  // ),

                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 30,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                    itemCount: cubit.movieDetailsModel?.genres
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) =>
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, BrowseDetails.routeName,
                                            arguments: cubit.movieDetailsModel?.genres?[index],
                                            );
                                          },
                                          child: CategoryChip(
                                              text: cubit.movieDetailsModel
                                                      ?.genres?[index].name ??
                                                  ""),
                                        ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Center(
                                    child: Text(
                                      // softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 9,
                                      cubit.movieDetailsModel?.overview ?? "",
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
                          padding: const EdgeInsets.all(20),
                          color: const Color(0xff282A28),
                          child: Column(
                            children: [
                              RowCategory(left: "More Like This"),
                              const SizedBox(
                                height: 15,
                              ),
                              const SimilarMovies()
                            ],
                          ),
                        )

                        // SimilarMovies(),
                      ],
                    ),

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
