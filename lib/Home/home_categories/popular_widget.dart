import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/custom_popular_movie.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';


class PopularWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPopular(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is PopularLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ));
          }
          var cubit = HomeCubit.get(context);
          return CarouselSlider(
              items: cubit.popularMoviesModel?.results?.map((popularIndex) {
                return CustomPopularMovie(popularIndex: popularIndex);
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.40,
              ));
        },
      ),
    );
  }
}
