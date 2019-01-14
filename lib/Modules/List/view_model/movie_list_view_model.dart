import 'package:movie_database/modules/list/model/movie.dart';

abstract class MovieListViewModel {
  Stream<List<Movie>> get movieList;
  
  void viewLoaded();
  void dispose();
}