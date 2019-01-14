import 'dart:async';

import 'package:movie_database/modules/list/view_model/movie_list_view_model.dart';
import 'package:movie_database/modules/list/model/movie.dart';
import 'package:movie_database/networking/network_data_provider.dart';
import 'package:movie_database/networking/model/result.dart';

class MovieListViewModelImpl implements MovieListViewModel {
  var _movieProvider = NetworkDataProvider();
  var _movieResultsController = StreamController<List<Movie>>.broadcast();

  void viewLoaded() async {
    Result<Movie> movies = await _movieProvider.fetchMovieList();
    _movieResultsController.sink.add(movies.results);
  }

  void dispose() {
    _movieResultsController.close();
  }

  Stream<List<Movie>> get movieList => _movieResultsController.stream;
}
