import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/Shared%20Widget/book_mark.dart';

import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class NewReleasesViewMovie extends StatelessWidget {
  NewReleasesViewMovie({super.key});
  bool checkMark = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit()..getNewReleasesMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var view=HomeCubit.get(context);
          if (state is NewReleaseLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ));
            }
            if (state is NewReleaseErrorState) {
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

            if (state is NewReleaseSuccessState) {
              return  SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.26,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 15,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            //id
                            Navigator.pushNamed(context, FilmDetails.routeName,arguments :view.newReleaseModel?.results?[index].id);
                          },
                          child: Stack(
                            children: [
                            CachedNetworkImage(
                            imageUrl: "https://image.tmdb.org/t/p/w500${view.newReleaseModel?.results?[index].posterPath??""}",
                            fit: BoxFit.fill,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            width:140 ,
                            placeholder: (context, text) =>
                                const Center(child: CircularProgressIndicator(color: Colors.yellow,)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),

                              const BookMark()

                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount:view.newReleaseModel?.results?.length??0,
                ),
              );
            }
            return const SizedBox();
          }),
    );


// Image.network("https://image.tmdb.org/t/p/w500${view.newReleaseModel!.results![index].posterPath!}",
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
