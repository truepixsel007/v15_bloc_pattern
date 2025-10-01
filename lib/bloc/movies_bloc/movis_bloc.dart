import 'package:bloc/bloc.dart';
import '../../data/response/api_response.dart';
import '../../repository/movies/movies_repository.dart';
import 'movis_event.dart';
import 'movis_state.dart';

class MoviesBloc extends Bloc<MoiviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository})
      : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_fetchMoviesListApi); // 👈 fixed: add underscore
  }

  Future<void> _fetchMoviesListApi(
      MoviesFetched event, Emitter<MoviesState> emit) async {
    try {
      final movies = await moviesRepository.fetchMoviesList();
      emit(state.copyWith(moviesList: ApiResponse.completed(movies)));
    } catch (error) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
    }
  }
}
