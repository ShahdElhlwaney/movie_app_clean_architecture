


import 'package:dartz/dartz.dart';

import 'package:movies_app/core/Error/failure.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';

import '../../../core/base_use_case.dart';
import '../entities/movie_detail.dart';
import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameters movieDetail) async {
   return await baseMoviesRepository.getMovieDetail(movieDetail);
  }
}
class MovieDetailParameters{
 final int movieId;

  MovieDetailParameters({required this.movieId});
}