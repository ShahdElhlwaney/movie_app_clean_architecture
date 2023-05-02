import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Error/exceptions.dart';
import 'package:movies_app/core/Error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_recommendations_use_case.dart';
import '../datasource/movie_remote_data_source.dart';
class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);
  @override                //Either<L,R>   L:failure, R:success
  Future<Either<Failure, List<Movie>>> getNowPayingMovies() async {
    final result=await baseMovieRemoteDataSource.getNowPlaying();
    try{
     return Right(result);
    } on ServerException catch (failure) {
       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
}
  @override
  Future<Either<Failure, List<Movie>>> getPopulrMovies() async {
    final result=await baseMovieRemoteDataSource.getPopular();
    try{
      return Right(result);
  }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result=await baseMovieRemoteDataSource.getTopRated();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailParameters movieDetailParameters)async {

    final result=await baseMovieRemoteDataSource.getMovieDetails(movieDetailParameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationParameters recommendationParameters) async {
    final result=await baseMovieRemoteDataSource.getRecommendation(recommendationParameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}