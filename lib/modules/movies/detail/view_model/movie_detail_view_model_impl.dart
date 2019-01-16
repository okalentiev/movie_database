import 'package:movie_database/modules/movies/detail/view_model/movie_detail_view_model.dart';
import 'package:movie_database/modules/movies/list/model/movie.dart';

class MovieDetailViewModelImpl implements MovieDetailViewModel {
  final Movie _movie;

  MovieDetailViewModelImpl(this._movie);

  String get description => _movie.overview;
  String get posterUrl => "https://image.tmdb.org/t/p/w780${_movie.backdropPath}";
  String get releaseDate => _movie.releaseDate;
  String get title => _movie.title;
  String get voteAverage => _movie.voteAverage.toString();
}