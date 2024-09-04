class HomeState {}

class HomeInitial extends HomeState {}

class PopularLoadingState extends HomeState {}

class PopularSuccessState extends HomeState {}

class PopularErrorState extends HomeState {
  String? errorMes;

  PopularErrorState({this.errorMes});
}

class NewReleaseLoadingState extends HomeState {}

class NewReleaseSuccessState extends HomeState {}

class NewReleaseErrorState extends HomeState {
  String? errorMes;

  NewReleaseErrorState({this.errorMes});
}

class RecommendedLoadingState extends HomeState {}

class RecommendedSuccessState extends HomeState {}

class RecommendedErrorState extends HomeState {
  String? errorMes;

  RecommendedErrorState({this.errorMes});
}

class MovieDetailsLoadingState extends HomeState {}

class MovieDetailsSuccessState extends HomeState {}

class MovieDetailsErrorState extends HomeState {
  // String? errorMes;
  // MovieDetailsErrorState({this.errorMes});
}

class GetMoviesGenresLoadingState extends HomeState {}

class GetMoviesGenresSuccessState extends HomeState {}

class GetMoviesGenresErrorState extends HomeState {}

class SimilarMoviesLoadingState extends HomeState {}

class SimilarMoviesSuccessState extends HomeState {}

class SimilarMoviesErrorState extends HomeState {}

class SearchMovieLoadingState extends HomeState {}

class SearchMovieSuccessState extends HomeState {}

class SearchMovieErrorState extends HomeState {}
class ChangeHomeState extends HomeState {}


