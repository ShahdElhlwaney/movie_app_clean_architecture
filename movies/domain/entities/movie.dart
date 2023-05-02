

import 'package:equatable/equatable.dart';

class Movie extends Equatable{

  final String backdropPath;
  final String title;
  final List<int> genreIds;
  final int id;
  final String overview;
  final double voteAverage;
  final String releaseDate;

 const Movie( {
    required this.backdropPath,
    required this.title,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.voteAverage,
   required this.releaseDate,
 });

  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    title,
    genreIds,
    id,
    overview,
    voteAverage,];



}