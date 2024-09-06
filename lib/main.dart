import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/browse/view/browse_details.dart';

import 'package:test123/home_screen.dart';

import 'package:test123/Home/view/movie_det.dart';
import 'package:test123/search/search.dart';
import 'package:test123/watch_list.dart';

import 'Home/home_categories/film_details.dart';
import 'Home/home_categories/home.dart';
import 'Home/view_model/home_cuibt.dart';
import 'bloc_observer.dart';
import 'browse/view/browse.dart';
import 'my_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getPopular()
        .. getNewReleasesMovies()
        ..getRecommendedMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        themeMode: ThemeMode.light,
        theme: MyThemeData.lightTheme,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          Home.routeName: (context) => const Home(),
          Search.routeName: (context) => const Search(),
          Browse.routeName: (context) => const Browse(),
          WatchList.routeName: (context) => const WatchList(),
          MovieDet.routeName: (context) => const MovieDet(),
          BrowseDetails.routeName: (context) => const BrowseDetails(),
          FilmDetails.routeName: (context) => const FilmDetails(),
        },
      ),
    );
  }
}
