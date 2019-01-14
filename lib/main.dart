import 'package:flutter/material.dart';
import 'Modules/List/ListWidget.dart';

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
      home: ListWidget(title: 'Movies'),
    );
  }
}
