import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/Shared%20Widget/custom_rate.dart';
import '../../Home/view_model/home_cuibt.dart';
import '../../Home/view_model/home_state.dart';
import '../../const.dart';
import '../../Home/view/movie_det.dart';

class CustomSearchTab extends StatelessWidget {
  const CustomSearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      if (state is SearchMovieLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        );
      }
      if (cubit.searchModel?.results?.isEmpty ??
          true && state is! SearchMovieLoadingState){
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
            ),
            Image.asset(
              "assets/images/empty.png",
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            Text(
              'No movies Found',
              style: GoogleFonts.inter(
                color: Colors.yellow,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );}
      if (state is SearchMovieErrorState) {
        return const Center(
          child: Text(
            "Some Error Occurred",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
      if (state is SearchMovieSuccessState) {
        return Column(
          children: [
            SizedBox(height: 20,),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 2, color: Colors.white, height: 20),
              itemCount: cubit.searchModel?.results?.length ?? 0,
              itemBuilder: (context, index) => Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, FilmDetails.routeName,
                          arguments: cubit.searchModel?.results?[index].id ?? 0);
                    },

                    child: Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width * 0.39,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child:CachedNetworkImage(
                        imageUrl:cubit.searchModel?.results?[index].posterPath==null?Const.wrongImagePoster:
                        'https://image.tmdb.org/t/p/w500'
                            '${cubit.searchModel?.results?[index].posterPath}',
                        fit: BoxFit.fill,
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        width: MediaQuery.sizeOf(context).height * 0.19,
                        placeholder: (context, text) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                            )),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.searchModel?.results?[index].title ?? '',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          cubit.searchModel?.results?[index].releaseDate ?? '',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomRate(
                            vote:
                                "${cubit.searchModel?.results?[index].voteAverage}" ??
                                    '')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }
}
// if (state is SearchMovieLoadingState)
//                       const Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.yellow,
//                         ),
//                       ),
//                     if (state is SearchMovieErrorState)
//                       Center(
//                         child: Text(
//                           "Some Error Occurred",
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     if (state is SearchMovieSuccessState)
//                       ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         separatorBuilder: (context, index) =>
//                             Divider(thickness: 2, color: Colors.yellowAccent),
//                         itemCount: cubit.searchModel?.results?.length ?? 0,
//                         itemBuilder: (context, index) => Row(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 alignment: Alignment.topLeft,
//                                 width: MediaQuery.of(context).size.width * 0.33,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.18,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: cubit.searchModel?.results?[index].posterPath == null
//                                         ? AssetImage("assets/images/2.png")
//                                         : NetworkImage(
//                                       'https://image.tmdb.org/t/p/w500'
//                                           '${cubit.searchModel?.results?[index].posterPath}',
//                                           ),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     cubit.searchModel?.results?[index].title ??
//                                         '',
//                                     style: GoogleFonts.inter(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     maxLines: 2,
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     cubit.searchModel?.results?[index]
//                                             .releaseDate ??
//                                         '',
//                                     style: GoogleFonts.inter(
//                                       color: Colors.yellow,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     cubit.searchModel?.results?[index]
//                                             .popularity
//                                             .toString() ??
//                                         '',
//                                     style: GoogleFonts.inter(
//                                       color: Colors.yellow,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
