// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Movie list app', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('AppBar title is set to Movies', () async {
      // First, define the Finders and use them to locate widgets from the
      // test suite.
      final titleTextFinder = find.byValueKey('list_title');

      // Use the `driver.getText` method to verify the title to be Movies
      expect(await driver.getText(titleTextFinder), "Movies");
    });

    test('Detail title is opened after item clicked', () async {
      // First, define the Finders and use them to locate widgets from the
      // test suite.
      final listItemFinder = find.byValueKey('movie_cell_list_tile0');
      final detailTitleFinder = find.byValueKey('movie_detail_item_title');

      await driver.tap(listItemFinder);

      // Use the `driver.getText` method to verify that the title of the movie is shown
      expect(await driver.getText(detailTitleFinder), isNotNull);
    });

  });
}