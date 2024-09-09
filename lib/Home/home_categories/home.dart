import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/popular_widget.dart';
import 'package:test123/Home/home_categories/recommended_widget.dart';
import 'package:test123/Home/view_model/home_cuibt.dart';
import 'package:test123/Home/view_model/home_state.dart';
import 'package:test123/watch_list/view_model/watch_list_cubit.dart';
import 'new_releases_widget.dart';


class Home extends StatelessWidget {
  static const String routeName = "home1";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // PopularWidget(),
              // NewReleasesWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: RecommendedWidget(),
              ),

            ],
          ),
        ));
  }
}


