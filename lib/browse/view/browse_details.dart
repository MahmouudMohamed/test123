import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/browse/view/custom_browser_details.dart';
import 'package:test123/browse/view_model/category_cubit.dart';

import '../../Shared Widget/book_mark.dart';
import '../../Shared Widget/custom_rate.dart';

class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const routeName = "browse_details";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) => CategoryCubit()..getBrowseShow(arguments.id.toString()),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is BrowseShowLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
          if (state is BrowseShowErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is BrowseShowSuccessState) {
            return CustomBrowserDetails(arguments: arguments);
            //   Scaffold(
            //  appBar: AppBar(
            //    title: Text(arguments.name.toString(),style: const TextStyle(color: Colors.white,),),
            //
            //  ),
            //     body: SingleChildScrollView(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //         child: Column(
            //           children: [
            //             const SizedBox(height: 15,),
            //             GridView.builder(
            //                           physics: const NeverScrollableScrollPhysics(),
            //                           itemCount: view.categoryModel?.results?.length ?? 0,
            //                           shrinkWrap: true,
            //                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 2,
            //             mainAxisSpacing: 20,
            //             childAspectRatio: 0.57
            //
            //                           ),
            //                           itemBuilder: (context, index) => InkWell(
            //             child: Card(
            //               color: Colors.grey,
            //               clipBehavior: Clip.antiAlias,
            //               child: Column(
            //
            //                 children: [
            //                   InkWell(
            //                     onTap: () {
            //                       Navigator.pushNamed(context, FilmDetails.routeName,
            //                           arguments:
            //                           view.categoryModel!.results![index].id);
            //                     },
            //                     child: Stack(
            //                       children: [
            //                         CachedNetworkImage(
            //                           imageUrl:
            //                           "https://image.tmdb.org/t/p/w500${view.categoryModel!.results![index].posterPath!}",
            //                           fit: BoxFit.fill,
            //                           height: MediaQuery.sizeOf(context).height * 0.30,
            //                           width: MediaQuery.sizeOf(context).height * 0.25,
            //                           placeholder: (context, text) => const Center(
            //                               child: CircularProgressIndicator(
            //                                 color: Colors.yellow,
            //                               )),
            //                           errorWidget: (context, url, error) =>
            //                           const Icon(Icons.error),
            //                         ),
            //                          BookMark()
            //                       ],
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.38,
            //                     child: Text(
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                       textAlign: TextAlign.center,
            //                       view.categoryModel?.results![index].originalTitle??"",
            //                       style: const TextStyle(color: Colors.white,fontSize: 15),
            //                     ),
            //                   ),
            //                   Center(
            //                     child: Text(
            //                       view.categoryModel!.results![index].releaseDate!
            //                           .substring(0, 10),
            //                       style: const TextStyle(color: Colors.white,fontSize: 14),
            //                     ),
            //                   ),
            //                   CustomRate(vote: "${view.categoryModel!.results![index].voteAverage}".substring(0,3))
            //                 ],
            //               ),
            //             )
            //             // child: Text(
            //             //   view.categoryModel?.results?[index].title ?? '',
            //             //   style: const TextStyle(color: Colors.white, fontSize: 25),
            //             // ),
            //                           ),
            //                         ),
            //           ],
            //         ),
            //       ),
            //     )
            // );
          }

          return Container();
        },
      ),
    );
  }
}
