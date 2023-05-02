


import 'package:dartz/dartz.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/Error/failure.dart';

class GetNowPlayingMovie extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMovie(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getNowPayingMovies();
  }



}