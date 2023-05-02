import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/Error/failure.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../entities/recommendation.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {


  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) {
    return baseMoviesRepository.getRecommendations(parameters);
  }

}


class RecommendationParameters extends Equatable {

  final int id;

  RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}