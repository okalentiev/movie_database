import 'package:movie_database/modules/list/view_model/movie_list_item_view_model.dart';

class MovieListItemViewModelImpl implements MovieListItemViewModel {
  final String _posterPath;
  final String _title;

  MovieListItemViewModelImpl(this._posterPath, this._title);

  // TODO: Refactor to use streams
  String get imagePath {
    return _posterPath != null ? 'https://image.tmdb.org/t/p/w342$_posterPath' : _posterPath;
  }

  String get titleText {
    return _title[0].toUpperCase() + _title.substring(1);
  }
}