import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_database/modules/movies/list/model/movie.dart';
import 'package:movie_database/networking/model/result.dart';
import 'package:movie_database/networking/network_data_provider.dart';

// Creating the mock Client
class MockClient extends Mock implements Client {}

void main() {

  group("NetworkDataProvider", ()
  {
    test("calls the client for data and maps the response", () async {
      // Given
      final mockClient = MockClient();
      // Injecting mock into our data provider
      final provider = NetworkDataProvider(mockClient);
      final responseString = await File('test/resources/movies_success.json')
          .readAsString();

      // When
      when(mockClient.get(
          'http://api.themoviedb.org/3/movie/now_playing?api_key=da0c0e40fa23a956aec2d5aa48032b32&page=1'))
          .thenAnswer((_) async => Response(responseString, 200));


      // Then
      expect(await provider.nowPlaying(1), isInstanceOf<Result<Movie>>());
    });

    test('throws an exception if the http call completes with an error', () async {
      // Given
      final mockClient = MockClient();
      // Injecting mock into our data provider
      final provider = NetworkDataProvider(mockClient);

      // When
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(mockClient.get('http://api.themoviedb.org/3/movies/now_playing?api_key=da0c0e40fa23a956aec2d5aa48032b32&page=1'))
          .thenAnswer((_) async => Response('Not Found', 404));

      // Then
      expect(provider.nowPlaying(1), throwsException);
    });
  });

}