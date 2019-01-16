import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_database/modules/movies/list/view_model/movie_list_item_view_model.dart';

abstract class MovieListViewModel {
  Stream<List<MovieListItemViewModel>> get movieList;
  Stream<Widget> get pushWidget;

  void cellSelected(int index);
  void viewLoaded();
  void reachingBottom();
  void dispose();
}