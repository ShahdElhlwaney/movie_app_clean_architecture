part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieRecommendation = const[],
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationmessage = '',
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = ''
  });

  final MovieDetail? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationmessage;


  MovieDetailsState copyWith({
    final List<Recommendation>? movieRecommendation,
    final RequestState? movieRecommendationState,
    final String? movieRecommendationmessage,
    final MovieDetail? movieDetails,
    final RequestState? movieDetailsState,
    final String? movieDetailsMessage}) {
    return MovieDetailsState(

        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationState: movieRecommendationState ??
            this.movieRecommendationState,
        movieRecommendationmessage: movieRecommendationmessage ??
            this.movieRecommendationmessage
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationmessage,
      ];



}


