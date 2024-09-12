import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../view/custom_popular_movie.dart';
import '../view_model/home_cuibt.dart';
import '../view_model/home_state.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getPopular(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            if (state is PopularLoadingState) {
              return Skeletonizer(
                enabled: true,
                child: CarouselSlider(
                    items: List.generate(
                      10, // Number of skeleton loaders to display
                          (index) => Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                color: Colors.grey[300],
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.3,
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.22,
                                left: MediaQuery.of(context).size.width * 0.07,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.26,
                                      height: MediaQuery.of(context).size.height * 0.21,
                                      alignment: Alignment.topRight,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.25),
                                            spreadRadius: 3,
                                            blurRadius: 2,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        width: MediaQuery.of(context).size.width * 0.1,


                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' ',
                                          style: GoogleFonts.inter(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                        Text(
                                          '',
                                          style: GoogleFonts.inter(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: MediaQuery.of(context).size.height * 0.038,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(5),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height * 0.40,
                    )),
              );
            }
            if (state is PopularSuccessState) {
              return CarouselSlider(
                  items: cubit.popularMoviesModel?.results?.map((popularIndex) {
                    return CustomPopularMovie(popularIndex: popularIndex);
                  }).toList()??[],
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.40,
                  ));
            }
            return Container();
          },
        ),
      );
  }
}
