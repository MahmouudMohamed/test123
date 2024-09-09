import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:test123/Home/model/VideoModel.dart';
import 'package:test123/const.dart';

import '../../browse/model/GenresModel.dart';
import '../../browse/view/browse.dart';
import '../../search/search.dart';
import '../../watch_list/watch_list.dart';
import '../home_categories/home.dart';
import '../model/MovieDetailsModel.dart';
import '../model/NewReleaseModel.dart';
import '../model/PopularMoviesModel.dart';
import '../model/RecommendedModel.dart';
import '../model/SearchModel.dart';
import '../model/SmillerMoviesModel.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  PopularMoviesModel? popularMoviesModel;
  NewReleaseModel? newReleaseModel;
  RecommendedModel? recommendedModel;
  MovieDetailsModel? movieDetailsModel;
  SmillerMoviesModel? similarMoviesModel;
  SearchModel?searchModel;
  GenresModel?genresModel;
  VideoModel?videoModel;

  static const String host = "api.themoviedb.org";

  Future<void> getPopular() async {
    emit(PopularLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/popular",
      {
        'language': 'en',
      },
    );

    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        popularMoviesModel = PopularMoviesModel.fromJson(
          jsonDecode(response.body),
        );
        emit(PopularSuccessState());
      } else {
        emit(PopularErrorState());
      }
    } catch (error) {
      emit(PopularErrorState(errorMes: error.toString()));
    }
  }

  getNewReleasesMovies() async {
    emit(NewReleaseLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/upcoming",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        newReleaseModel = NewReleaseModel.fromJson(
          jsonDecode(response.body),
        );
        emit(NewReleaseSuccessState());
      } else {
        emit(NewReleaseErrorState());
      }
    } catch (error) {
      emit(NewReleaseErrorState(errorMes: error.toString()));
    }
  }

  getRecommendedMovies() async {
    emit(RecommendedLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/top_rated",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        recommendedModel = RecommendedModel.fromJson(
          jsonDecode(response.body),
        );
        emit(RecommendedSuccessState());
      } else {
        emit(RecommendedErrorState());
      }
    } catch (error) {
      emit(RecommendedErrorState(errorMes: error.toString()));
    }
  }

  getMovieDetails(movieId) async {
    emit(MovieDetailsLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/$movieId",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        movieDetailsModel = MovieDetailsModel.fromJson(
          jsonDecode(response.body),
        );
        emit(MovieDetailsSuccessState());
      } else {
        emit(MovieDetailsErrorState());
      }
    } catch (error) {
      emit(MovieDetailsErrorState());
    }
  }

  getSimilarMovieDetails(movieId) async {
    emit(SimilarMoviesLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/$movieId/similar",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        similarMoviesModel = SmillerMoviesModel.fromJson(
          jsonDecode(response.body),
        );
        emit(SimilarMoviesSuccessState());
      } else {
        emit(SimilarMoviesErrorState());
      }
    } catch (error) {
      emit(SimilarMoviesErrorState());
    }
  }

  getSearchMovie(String query) async {
    emit(SearchMovieLoadingState());
    Uri url = Uri.https(
      host,
      "/3/search/movie",
      {
        'language': 'en',
        "query":query
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        searchModel = SearchModel.fromJson(
          jsonDecode(response.body),
        );
        emit(SearchMovieSuccessState());
      } else {
        emit(SearchMovieErrorState());
      }
    } catch (error) {
      emit(SearchMovieErrorState());
    }
  }

  getVideoMovie(movieId) async {
    emit(VideoMovieLoadingState());
    Uri url = Uri.https(
      host,
      "/3/movie/$movieId/videos",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        videoModel = VideoModel.fromJson(
          jsonDecode(response.body),
        );
        emit(VideoMovieSuccessState());
      } else {
        emit(VideoMovieErrorState());
      }
    } catch (error) {
      emit(VideoMovieErrorState());
    }
  }




  int index = 0;

  List<Widget> page = [
    const Home(),
    const Search(),
    const Browse(),
    const WatchList(),
  ];
  changeHomeScreen(value){
    index = value;
    emit(ChangeHomeState());
  }
}
