

import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_now_playing_movies_useCase.dart';
import '../../movies/domain/usecases/get_popular_movies_useCase.dart';
import '../../movies/domain/usecases/get_recommendations_use_case.dart';
import '../../movies/domain/usecases/get_top_rated_movies_useCase.dart';

final sl = GetIt.instance;

class ServiceLocator{

void init(){
  /// Bloc
  sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));//new object
  sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));//new object
  /// use case
  sl.registerLazySingleton(() => GetNowPlayingMovie(sl()));//the same object
  sl.registerLazySingleton(()=>GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetTopRatedUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
  /// Data Source
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  
}
}