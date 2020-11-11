import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cine_con_mojo_flutter_app/src/models/actors_model.dart';
import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';

class MoviesProvider {

  String _apikey = '6b620a8ab956bb4d6bdf7f8edc5c070b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _popularMovies = new List();

  final _popularMoviesStreamController = StreamController<List<Movie>>.broadcast();

  Function( List<Movie> ) get popularMoviesSink => _popularMoviesStreamController.sink.add;

  Stream<List<Movie>> get popularMoviesStream => _popularMoviesStreamController.stream;



  void disposeStreams ( ) { _popularMoviesStreamController?.close(); }


  Future<List<Movie>> _processResponse(Uri url) async {
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getInTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language
    });
    return await _processResponse(url);
  } // getInTheaters

  Future<List<Movie>> getPopular() async {

    if( _loading ) return [];
    _loading = true;

    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page'    : _popularPage.toString()
    });
    final resp = await _processResponse(url);
    _popularMovies.addAll(resp);
    popularMoviesSink(_popularMovies);

    _loading = false;
    return resp;
  } // getPopular

  Future<List<Actor>> getCast( String movieId ) async {

    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apikey,
      'language': _language
    });

    final resp = await http.get(url);
    final decodeData = json.decode( resp.body );

    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actors;

  }

}// MoviesProvider