

import '../../domain/entities/movie.dart';

class MovieModel extends Movie{
  MovieModel({
    required super.backdropPath,
    required super.title,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate
   });

  factory MovieModel.fromJson(Map<String,dynamic>json)=>MovieModel(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      genreIds:List.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      overview: json['overview'],
      // ToDo CHECK THIS
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']
  );







}