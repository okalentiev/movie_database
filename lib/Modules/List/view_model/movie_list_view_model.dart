import 'package:movie_database/modules/list/view_model/movie_list_item_view_model.dart';

abstract class MovieListViewModel {
  Stream<List<MovieListItemViewModel>> get movieList;
  
  void viewLoaded();
  void reachingBottom();
  void dispose();
}