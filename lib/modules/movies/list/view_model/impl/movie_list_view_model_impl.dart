import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:movie_database/modules/movies/detail/view/movie_detail_view.dart';
import 'package:movie_database/modules/movies/detail/view_model/movie_detail_view_model_impl.dart';
import 'package:movie_database/modules/movies/list/model/movie.dart';
import 'package:movie_database/modules/movies/list/view_model/impl/movie_list_item_view_model_impl.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_item_view_model.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_view_model.dart';
import 'package:movie_database/networking/model/result.dart';
import 'package:movie_database/networking/network_data_provider.dart';

class MovieListViewModelImpl implements MovieListViewModel {
  final _movieProvider = NetworkDataProvider(Client());
  final _movieResultsController = StreamController<List<MovieListItemViewModel>>.broadcast();
  final _pushController = StreamController<Widget>.broadcast();

  Result<Movie> _moviesResponse;
  var _loading = false;
  var _movies = List<Movie>();
  var _moviesViewModels = List<MovieListItemViewModel>();

  Stream<List<MovieListItemViewModel>> get movieList => _movieResultsController.stream;
  Stream<Widget> get pushWidget => _pushController.stream;

  void viewLoaded() {
    _loadMovies();
  }

  void dispose() {
    _movieResultsController.close();
    _pushController.close();
  }

  void reachingBottom() async {
    if (!_loading &&
        _moviesResponse != null &&
        _moviesResponse.page < _moviesResponse.totalPages) {
      _loadMovies(page: _moviesResponse.page + 1);
    }
  }

  void cellSelected(int index) {
    _pushController.sink.add(MovieDetail(viewHandler: MovieDetailViewModelImpl(_movies[index])));
  }

  void _loadMovies({page = 1}) async {
    _loading = true;
    Result<Movie> movies = await _movieProvider.nowPlaying(page);
    _movies.addAll(movies.results);
    _moviesViewModels.addAll(movies.results.map((movie) => MovieListItemViewModelImpl(movie.posterPath, movie.title)));
    _moviesResponse = movies;
    _movieResultsController.sink.add(_moviesViewModels);
    _loading = false;
  }
}
