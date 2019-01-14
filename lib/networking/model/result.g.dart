// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result<ResultType> _$ResultFromJson<ResultType>(Map<String, dynamic> json) {
  return Result<ResultType>(
      results: (json['results'] as List)
          ?.map((e) => e == null ? null : _Converter<ResultType>().fromJson(e))
          ?.toList(),
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int);
}

Map<String, dynamic> _$ResultToJson<ResultType>(Result<ResultType> instance) =>
    <String, dynamic>{
      'results': instance.results
          ?.map((e) => e == null ? null : _Converter<ResultType>().toJson(e))
          ?.toList(),
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages
    };
