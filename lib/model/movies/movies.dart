import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
abstract class MoviesModel with _$MoviesModel {
  factory MoviesModel({
    // @Default('') @JsonKey(name: 'total') String total,
    @Default(0) int total, // Total number of movies
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
abstract class TvShows with _$TvShows {
  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'permalink') @Default('') String permalink,
    @JsonKey(name: 'endDate') @Default('') String endDate,
    @JsonKey(name: 'network') @Default('') String network,
    @JsonKey(name: 'imageThumbnailPath') @Default('') String imageThumbnailPath,
    @JsonKey(name: 'status') @Default('') String status,
  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
