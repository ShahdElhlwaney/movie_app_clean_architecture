

import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/Error/failure.dart';
import '../../../core/base_use_case.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{

  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getPopulrMovies();
  }


}