import 'package:json_annotation/json_annotation.dart';

part 'Result.g.dart';

@JsonSerializable()
class Result<ResultType> {
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
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

T _dataFromJson<T>(Map<String, dynamic> input) {
  return input['results'] as T;
}

Map<String, dynamic> _dataToJson<T>(T input) =>
    {'results': input};