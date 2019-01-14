import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
    @JsonKey(name: "id")
    final int movieId;

    final String title;
    
    @JsonKey(name: "poster_path", nullable: true)
    final String posterPath;

    @JsonKey(name: "backdrop_path", nullable: true)
    final String backdropPath;

    final String overview;

    Movie(this.movieId, this.title, this.posterPath, this.backdropPath, this.overview);
    
    factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);
}