import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:movie_database/modules/list/model/movie.dart';
import 'package:movie_database/networking/model/result.dart';
import 'package:uri/uri.dart';

class NetworkDataProvider {
  Client client = Client();
  final _apiKey = 'da0c0e40fa23a956aec2d5aa48032b32';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<Result<Movie>> nowPlaying(int page) async {
    var template = UriTemplate("$_baseUrl/now_playing{?api_key,page}");
    String requestUrl = template.expand({"api_key": _apiKey, "page": page});
    final response = await client.get(requestUrl);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Result<Movie>.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load movie list');
    }
  }
}
