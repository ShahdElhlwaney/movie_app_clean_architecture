
import 'package:dio/dio.dart';
import 'package:movies_app/core/Error/exceptions.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_use_case.dart';

import '../../../core/Network/api_constance.dart';
import '../../../core/Network/error_message_model.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../models/movie_details_model.dart';
import '../models/recommendationModel.dart';
 abstract class BaseMovieRemoteDataSource{
   Future<List<MovieModel>>getNowPlaying();
   Future<List<MovieModel>>getPopular();
   Future<List<MovieModel>>getTopRated();
   Future<MovieDetailsModel>getMovieDetails(MovieDetailParameters movieDetailParameter);
   Future<List<Recommendation>>getRecommendation(RecommendationParameters recommendationParameters);
 }
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
   Future<List<MovieModel>>getNowPlaying()async{
     
    final response= await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if(response.statusCode==200)
      {
        return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
      }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

   }
  @override
  Future<List<MovieModel>> getPopular() async {
    final response=await Dio().get(ApiConstance.popularPath);
    
          if(response.statusCode==200)
            {
              return List<MovieModel>.from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
            }
          else{
            throw ServerException(errorMessageModel: response.data);
          }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response=await Dio().get(ApiConstance.topRatedPath);

    if(response.statusCode==200)
    {
      return List<MovieModel>.from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailParameters movieDetailsParameter)async {

    final response= await Dio().get(ApiConstance.movieDetailsUrl(movieDetailsParameter.movieId));

    if(response.statusCode==200)
    {
      return MovieDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getRecommendation(RecommendationParameters recommendationParameters)async {
    final response=await Dio().get(ApiConstance.movieRecommendationUrl(recommendationParameters.id));
    if(response.statusCode==200)
      {
        return List<Recommendation>.from((response.data['results'] as List).map((e) =>
        RecommendationModel.fromJson(e)));
      }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }




}