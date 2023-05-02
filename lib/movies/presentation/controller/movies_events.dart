
import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{

  MoviesEvent();
  @override
  List<Object?> get props => [];

}
class GetNowPlayingMoviesEvent extends MoviesEvent{}

class GetPopularEvent extends MoviesEvent{}

class GetTopRatedEvent extends MoviesEvent{}

