import 'package:equatable/equatable.dart';
// import 'package:v15/data/response/api_response.dart';

import '../../data/response/api_response.dart';
import '../../model/movies/movies.dart';

class MoviesState extends Equatable {
  const MoviesState({required this.moviesList});

  final ApiResponse<MoviesModel> moviesList;

  MoviesState copyWith({
    ApiResponse<MoviesModel>? moviesList,
  }) {
    return MoviesState(
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [moviesList];

}