part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  @override
  List<Object?> get props => [];
}
class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieDetailsEvent(this.id);
}
class MovieDetailsRecommendationsEvent extends MovieDetailsEvent{
  final int id;

  MovieDetailsRecommendationsEvent(this.id);
}