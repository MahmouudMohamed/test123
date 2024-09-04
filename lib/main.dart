import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/browse/view/browse_details.dart';

import 'package:test123/home_screen.dart';

import 'package:test123/search/movie_det.dart';
import 'package:test123/search/search.dart';
import 'package:test123/watch_list.dart';

import 'Home/home_categories/film_details.dart';
import 'Home/home_categories/home.dart';
import 'bloc_observer.dart';
import 'browse/view/browse.dart';
import 'my_theme_data.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,

      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        Home.routeName:(context)=>Home(),
        Search.routeName:(context)=>Search(),
        Browse.routeName:(context)=>Browse(),
        WatchList.routeName:(context)=>WatchList(),
        MovieDet.routeName:(context)=>MovieDet(),
        BrowseDetails.routeName:(context)=>BrowseDetails(),
        FilmDetails.routeName:(context)=>FilmDetails(),
      },
    );
  }
}
