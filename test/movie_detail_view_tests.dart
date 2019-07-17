import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_database/modules/movies/detail/view/movie_detail_view.dart';
import 'package:movie_database/modules/movies/detail/view_model/movie_detail_view_model_impl.dart';
import 'package:movie_database/modules/movies/list/model/movie.dart';

import 'mock_image_http.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MovieDetailWidget has title, overview, vote and release date',
      (WidgetTester tester) async {
    // This helps us to override default http client that is used by the NetworkImage
    HttpOverrides.runZoned<Future<void>>(() async {
      // Given
      final title = 'title';
      final posterPath = 'poster';
      final backdropPath = '/xRWht48C2V8XNfzvPehyClOvDni.jpg';
      final overview = 'overview';
      final releaseDate = 'releaseDate';
      final voteAverage = 5.0;
      final movie = Movie(1, title, posterPath, backdropPath, overview, releaseDate, voteAverage);
      final viewModel = MovieDetailViewModelImpl(movie);

      // When
      await tester.pumpWidget(MaterialApp(
          home: MovieDetail(
        viewHandler: viewModel,
      )));

      // Then
      // Checking that all our expected texts are present
      expect(find.text(title), findsOneWidget);
      expect(find.text(overview), findsOneWidget);
      expect(find.text(releaseDate), findsOneWidget);
      expect(find.text(voteAverage.toString()), findsOneWidget);
    },
        // Here we mock the loading of the images
        createHttpClient: createMockImageHttpClient);
  });
}
