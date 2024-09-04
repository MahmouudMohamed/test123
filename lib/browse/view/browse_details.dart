import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/browse/view_model/category_cubit.dart';
import 'package:test123/search/movie_det.dart';

class BrowseDetails extends StatelessWidget {
  BrowseDetails({super.key});

  static const routeName = "browse_details";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as dynamic;
    debugPrint(arguments.toString());
    return BlocProvider(
      create: (context) => CategoryCubit()..getBrowseShow(arguments),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var view = CategoryCubit.get(context);
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
            return Scaffold(
                body: GridView.builder(
              itemCount: view.categoryModel?.results?.length ?? 0,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 5,

              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FilmDetails.routeName,
                      arguments: view.categoryModel?.results?[index].id);
                },
                child: Text(
                  view.categoryModel?.results?[index].title ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ));
          }

          return Container();
        },
      ),
    );
  }
}
