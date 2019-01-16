import 'package:json_annotation/json_annotation.dart';
import 'package:movie_database/modules/movies/list/model/movie.dart';

part 'result.g.dart';

@JsonSerializable()
class Result<ResultType> {
    @_Converter()
    final List<ResultType> results;

    final int page;

    @JsonKey(name: 'total_results')
    final int totalResults;

    @JsonKey(name: 'total_pages')
    final int totalPages;

    Result({this.results, this.page, this.totalResults, this.totalPages});
    
    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
    const _Converter();

    @override
    T fromJson(Object json) {

        if (json is Map<String, dynamic> &&
            json.containsKey('poster_path') &&
            json.containsKey('id')) {
          return Movie.fromJson(json) as T;
        }
        return json as T;
    }

    @override
    Object toJson(T object) {
        return object;
    }
}