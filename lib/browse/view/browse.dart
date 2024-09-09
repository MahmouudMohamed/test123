import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test123/browse/view/browse_details.dart';
import 'package:test123/browse/view/custom_browse.dart';
import 'package:test123/browse/view_model/category_cubit.dart';


class Browse extends StatelessWidget {
  static const String routeName = "b";

  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getGenreMovies(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if(state is GenreMovieLoadingState){
            return Skeletonizer(
              enabled:true,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(''),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 120),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              width: 180,
                              height: 110,
                            ),
                          ],
                        );
                      },
                      itemCount: 15,
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is GenreMovieErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if(state is GenreMovieSuccessState){
          return CustomBrowse();}
          return Container();
        },
      ),
    );
  }
}
