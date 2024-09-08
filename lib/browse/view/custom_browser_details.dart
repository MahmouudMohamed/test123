import 'package:cached_network_image/cached_network_image.dart';import 'package:flutter/material.dart';

import '../../Home/home_categories/film_details.dart';
import '../../Shared Widget/book_mark.dart';
import '../../Shared Widget/custom_rate.dart';
import '../view_model/category_cubit.dart';

class CustomBrowserDetails extends StatelessWidget {
  dynamic arguments;

  CustomBrowserDetails({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    var view = CategoryCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments.name.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: view.categoryModel?.results?.length ?? 0,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.57),
                  itemBuilder: (context, index) => InkWell(
                      child: Card(
                    color: Colors.grey,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, FilmDetails.routeName,
                                arguments:
                                    view.categoryModel!.results![index].id);
                          },
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${view.categoryModel!.results![index].posterPath!}",
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.30,
                                width: MediaQuery.sizeOf(context).height * 0.25,
                                placeholder: (context, text) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // BookMark()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            view.categoryModel?.results![index].originalTitle ??
                                "",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Center(
                          child: Text(
                            view.categoryModel!.results![index].releaseDate!
                                .substring(0, 10),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                        CustomRate(
                            vote:
                                "${view.categoryModel!.results![index].voteAverage}"
                                    .substring(0, 3))
                      ],
                    ),
                  )

                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
