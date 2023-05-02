import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base_use_case.dart';
import '../../../core/utils/enum.dart';
import '../../domain/usecases/get_now_playing_movies_useCase.dart';
import '../../domain/usecases/get_popular_movies_useCase.dart';
import '../../domain/usecases/get_top_rated_movies_useCase.dart';
import 'movies_events.dart';
import 'movies_states.dart';
class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingMovie getNowPlayingMovie;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  MoviesBloc(this.getNowPlayingMovie,this.getPopularMoviesUseCase,this.getTopRatedUseCase):super(const MoviesState()){
                                                                   //once i create the bloc,it calls the first event
                                                                  //this happens using on
    on<GetNowPlayingMoviesEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetTopRatedEvent>(_getTopRated);
 }
  Future<void> _getNowPlaying(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async
  {
    final result = await getNowPlayingMovie(NoParameters());

    result.fold((l) => emit(
        state.copyWith(
            nowPlayingState:RequestState.error,
            nowPlayingMessage: l.message
        )),
            (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r
        )));
  }
  Future<void> _getPopular(GetPopularEvent event, Emitter<MoviesState> emit) async
  {
    final result=await getPopularMoviesUseCase(NoParameters());
    result.fold((l) => emit(
        state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message
        )),
            (r) => emit(
            state.copyWith(
                popularState: RequestState.loaded,
                popularMovies: r
            )
        ));
  }
  Future<void> _getTopRated(GetTopRatedEvent event, Emitter<MoviesState> emit) async
  {
    final result=await getTopRatedUseCase(NoParameters());
    result.fold((l) => emit(
        state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message
        )),
            (r) => emit(
            state.copyWith(
              topRatedState: RequestState.loaded,
              topRatedMovies: r,
            )
        ));
  }
}