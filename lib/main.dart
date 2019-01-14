import 'package:flutter/material.dart';
import 'package:movie_database/modules/list/view/movie_list_widget.dart';

void main() => runApp(MovieDatabase());

class MovieDatabase extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MovieList(title: 'Movies'),
    );
  }
}
