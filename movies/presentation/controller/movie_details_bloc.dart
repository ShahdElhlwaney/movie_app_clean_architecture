import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';

import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../../domain/usecases/get_recommendations_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<MovieDetailsRecommendationsEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    
    final result= await getMovieDetailsUseCase(MovieDetailParameters(movieId: event.id));
    result.fold((l) => emit( state.copyWith(
      movieDetailsState: RequestState.loading,
      movieDetailsMessage: l.message
    ))
        , (r) =>emit( state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails:r
        )));
  }
  FutureOr<void> _getRecommendation(MovieDetailsRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {

     final result=await getRecommendationUseCase(RecommendationParameters(event.id));
     result.fold((l) => emit(state.copyWith(
       movieRecommendationState: RequestState.error,
       movieRecommendationmessage: l.message
     )), (r) =>
         emit(state.copyWith(
           movieRecommendationState: RequestState.loaded,
           movieRecommendation: r
         ))
     );
  }
}
