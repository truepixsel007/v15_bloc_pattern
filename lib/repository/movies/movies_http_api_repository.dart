// import 'package:v15/config/app_url.dart';
// import 'package:v15/data/network/network_api_service.dart';
// import 'package:v15/repository/movies/movies_repository.dart';

import '../../config/app_url.dart';
import '../../data/network/network_api_service.dart';
import '../../model/movies/movies.dart';
import 'movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {

  final _apiServices = NetworkApiService();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }
}

