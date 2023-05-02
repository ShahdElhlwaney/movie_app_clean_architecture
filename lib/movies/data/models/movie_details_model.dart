


import '../../domain/entities/movie_detail.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetail{
  MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.runTime,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.overview
  });
  factory MovieDetailsModel.fromJson(Map<String,dynamic>json){
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(json['genres'].map((x) => GenresModel.fromJson(x))),
        id: json['id'],
        runTime: json['runtime'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview']
    );
  }





}