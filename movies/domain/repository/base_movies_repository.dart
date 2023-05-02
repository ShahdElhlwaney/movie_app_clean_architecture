
import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_use_case.dart';

import '../../../core/Error/failure.dart';
import '../entities/movie_detail.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details_use_case.dart';

abstract class BaseMoviesRepository{

    Future<Either<Failure, List<Movie>>> getNowPayingMovies();
    Future<Either<Failure, List<Movie>>> getPopulrMovies();
    Future<Either<Failure, List<Movie>>> getTopRatedMovies();
    Future<Either<Failure,MovieDetail>> getMovieDetail(MovieDetailParameters movieDetailParameters);
    Future<Either<Failure,List<Recommendation>>> getRecommendations(RecommendationParameters recommendationParameters);

   //
}