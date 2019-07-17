import 'package:flutter_test/flutter_test.dart';
import 'package:movie_database/modules/movies/list/view_model/impl/movie_list_item_view_model_impl.dart';

void main() {
  group('MovieListItemViewModel', () {
    test('should capitalize titleText', () {
      // Given
      final testTitle = 'testTitle';
      final viewModel = MovieListItemViewModelImpl(null, testTitle);

      // Then
      expect(viewModel.titleText, 'TestTitle');
    });

    test('with null posterPath should return null', () {
      // Given
      final viewModel = MovieListItemViewModelImpl(null, null);

      // Then
      expect(viewModel.imagePath, isNull);
    });

    test('with posterPath should return imagePath', () {
      // Given
      final testPath = '/testPath';
      final viewModel = MovieListItemViewModelImpl(testPath, null);

      // Then
      expect(viewModel.imagePath, 'https://image.tmdb.org/t/p/w342/testPath');
    });
  });
}