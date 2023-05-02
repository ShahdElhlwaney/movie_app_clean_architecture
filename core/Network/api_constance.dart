
class ApiConstance{
  static String baseUrl='https://api.themoviedb.org/3';
  static String apiKey='db3c6529d241fca3e299c3afad32c2a4';
  static String nowPlayingMoviesPath='$baseUrl/movie/now_playing?api_key=$apiKey';
  static String popularPath='$baseUrl/movie/popular?api_key=$apiKey';
  static String topRatedPath='$baseUrl/movie/top_rated?api_key=$apiKey';
  static String baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=>'$baseImageUrl$path';
  static String movieDetailsUrl(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apiKey';
  static String movieRecommendationUrl(int id)=>'$baseUrl/movie/$id/recommendations?api_key=$apiKey';
}
