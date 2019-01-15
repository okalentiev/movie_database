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

    @JsonKey(name: "release_date")
    final String releaseDate;

    @JsonKey(name: "vote_average")
    final double voteAverage;

    Movie(this.movieId, this.title, this.posterPath, this.backdropPath, this.overview, this.releaseDate, this.voteAverage);
    
    factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);
}