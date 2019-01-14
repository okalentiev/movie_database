// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result<ResultType> _$ResultFromJson<ResultType>(Map<String, dynamic> json) {
  return Result<ResultType>(
      results: json['results'] == null
          ? null
          : _dataFromJson(json['results'] as Map<String, dynamic>),
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int);
}

Map<String, dynamic> _$ResultToJson<ResultType>(Result<ResultType> instance) =>
    <String, dynamic>{
      'results':
          instance.results == null ? null : _dataToJson(instance.results),
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages
    };
