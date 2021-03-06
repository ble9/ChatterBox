import 'dart:convert';
import 'package:ChatterBox/model/featuredmoviemodel.dart';
import 'package:ChatterBox/model/genremodel.dart';
import 'package:ChatterBox/model/moviemodel.dart';
import 'package:http/http.dart' as http;


class Api {
  var httpClient = http.Client();

  static const url = "https://api.themoviedb.org/3";
  static const apiKey = "23c5c494feb8bd4e116b8820cc2938bd";

  Future<List<GenreModel>> getGenreList() async {
    final response = await http.get('$url/genre/movie/list?api_key=$apiKey');

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['genres'].cast<Map<String, dynamic>>();

      return parsed
          .map<GenreModel>((json) => GenreModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<FeaturedMovieModel>> getFeaturedMovies() async {
    final response = await http.get('$url/trending/movie/day?api_key=$apiKey');
    print(response.body);
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
          print(parsed);
      return parsed
          .map<FeaturedMovieModel>((json) => FeaturedMovieModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load featured movies');
    }
  }

  Future<MovieModel> getMovieInfo(int movieId) async{
    final response = await http.get("$url/movie/$movieId?api_key=$apiKey");

    if (response.statusCode == 200){
      return MovieModel.fromJson(json.decode(response.body));
    } else{
      throw Exception('Failed to load Movie Information');
    }
  }
}
