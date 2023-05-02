

import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable{


  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final int runTime;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final String overview;

  const MovieDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.runTime,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.overview});

  @override
  List<Object?> get props => [backdropPath,genres,id,runTime,releaseDate,title,voteAverage,overview];
  
}