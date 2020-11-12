import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';
import 'package:cine_con_mojo_flutter_app/src/providers/movies_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String selection = '';
  final moviesProvider = new MoviesProvider();

  final movies = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestgro AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono al inicio del AppBar (izquierda)
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data;
            return ListView(
                children: movies.map((movie) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImg()),
                  placeholder: AssetImage('assets/img/noimage.png'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.original_title),
                onTap: () {
                  close(context, null);
                  movie.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: movie);
                },
              );
            }).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  } // buildSuggestions

}

// EJEMPLO
// @override
// Widget buildSuggestions(BuildContext context) {
//   // Sugerencias que aparecen
//
//   final suggestedList = (query.isEmpty)
//       ? recentMovies
//       : movies
//       .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
//       .toList();
//
//   return ListView.builder(
//     itemCount: suggestedList.length,
//     itemBuilder: (context, i) {
//       return ListTile(
//         leading: Icon(Icons.movie),
//         title: Text(suggestedList[i]),
//         onTap: () {
//           selection = suggestedList[i];
//           showResults(context);
//         },
//       );
//     },
//   );
// }
