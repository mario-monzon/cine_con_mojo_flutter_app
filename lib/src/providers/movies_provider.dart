import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';

class MoviesProvider {

  String _apikey = '6b620a8ab956bb4d6bdf7f8edc5c070b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getInTheaters() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language
    });

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;

  } // getInTheaters

}// MoviesProvider