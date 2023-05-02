
import 'package:dartz/dartz.dart';

import '../../../core/Error/failure.dart';
import '../../../core/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters)async {
    return await baseMoviesRepository.getTopRatedMovies();
  }



}