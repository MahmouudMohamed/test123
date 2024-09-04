import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test123/search/view/custom_search_tab.dart';

import '../Home/view_model/home_cuibt.dart';
import '../Home/view_model/home_state.dart';
class Search extends StatelessWidget {
  static const String routeName = "s";

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
                    TextFormField(
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorColor: Colors.white.withOpacity(0.67),
                      onChanged: (query) {
                        cubit.getSearchMovie(query);
                        if (query == '') {
                          cubit.searchModel?.results?.isEmpty ?? true;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Colors.grey,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.67),
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                      ),
                    ),
                    CustomSearchTab()

                  ]),
                ),
              ),
            ));
          },
        ));
  }
}

// if (state is SearchMovieLoadingState)
//                           const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.yellow,
//                             ),
//                           ),
//                         else
//                           ListView.separated(
//                             separatorBuilder: (context, index) => Divider(thickness: 2, color: Colors.yellowAccent),
//                             itemCount: cubit.searchModel?.results?.length ?? 0,
//                             itemBuilder: (context, index) => Row(
//                               children: [
//                                 InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     alignment: Alignment.topLeft,
//                                     width: MediaQuery.of(context).size.width *
//                                         0.33,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                           'https://image.tmdb.org/t/p/w500${cubit.searchModel?.results?[index].posterPath ?? ''}',
//                                         ),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         cubit.searchModel?.results?[index]
//                                                 .title ??
//                                             '',
//                                         style: GoogleFonts.inter(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                         maxLines: 2,
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Text(
//                                         cubit.searchModel?.results?[index]
//                                                 .releaseDate ??
//                                             '',
//                                         style: GoogleFonts.inter(
//                                           color: Colors.yellow,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Text(
//                                         cubit.searchModel?.results?[index]
//                                                 .popularity
//                                                 .toString() ??
//                                             '',
//                                         style: GoogleFonts.inter(
//                                           color: Colors.yellow,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//           var cubit = HomeCubit.get(context);
//           return Scaffold(
//               body: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(children: [
//                     TextFormField(
//                       onChanged: (query) {
//                         cubit.getSearchMovie(query);
//                         if (query == '') {
//                           cubit.searchModel?.results?.isEmpty ?? true;
//                         }
//                       },
//                       style: GoogleFonts.inter(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       decoration: InputDecoration(
//                         filled: true,
//                         prefixIcon: const Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         ),
//                         fillColor: Colors.grey,
//                         border: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         hintText: 'Search',
//                         hintStyle: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     if (state is SearchMovieLoadingState)
//                       const Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.yellow,
//                           ),
//                         ),
//                       ),
//                     if (cubit.searchModel?.results?.isEmpty ??
//                         true && state is! SearchMovieLoadingState)
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.sizeOf(context).height * 0.25,
//                           ),
//                           Image.asset(
//                             "assets/images/search.png",
//                           ),
//                           Text(
//                             'No movies Found',
//                             style: GoogleFonts.inter(
//                               color: Colors.white.withOpacity(0.67),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       )
//                     else
//           ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (context, index) => Column(
//           children: [
//           SizedBox(
//           height: 10,
//           ),
//           const Divider(),
//           SizedBox(
//           height: 10,
//           ),
//           ],
//           ),
//           itemCount: cubit.searchModel?.results?.length ?? 0,
//           itemBuilder: (context, index) => Row(
//           children: [
//           InkWell(
//           onTap: () {
//
//           },
//           child: Container(
//           alignment: Alignment.topLeft,
//           width: MediaQuery.of(context).size.width * 0.33,
//           height:
//           MediaQuery.of(context).size.height * 0.195,
//           decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//           image: NetworkImage(
//           'https://image.tmdb.org/t/p/w500${cubit.searchModel?.results?[index].posterPath ?? ''}',
//           ),
//           fit: BoxFit.fill,
//           ),
//           ),
//           child: InkWell(
//           onTap: () {},
//           child: Container(
//           height: 40,
//           decoration: const BoxDecoration(
//           color: Colors.transparent,
//           image: DecorationImage(
//           image: AssetImage(
//           "assets/images/play.png",
//           ),
//           ),
//           ),
//           child: Icon(
//           cubit.isWatchList
//           ? Icons.check
//               : Icons.add,
//           color: Colors.white,
//           ),
//           ),
//           ),
//           ),
//           ),
//                   ])));
//         },
//       ),
//     );
//   }
// }
