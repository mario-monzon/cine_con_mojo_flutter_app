import 'package:cine_con_mojo_flutter_app/src/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Recibe los arguments del pushNamed del HomePage
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppbar( movie ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox( height: 10.0, ),
                  _posterTitle( context, movie ),
                  _movieOverview( movie ),
                  _movieOverview( movie ),
                  _movieOverview( movie ),
                  _movieOverview( movie ),
                  _createCasting( movie ),
                ]
              )),
        ],
      )
    );
  }

  Widget _createAppbar( Movie movie ){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepPurple,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle( color: Colors.white, fontSize: 16.0 ),
        ),
        background: FadeInImage(
          image: NetworkImage( movie.getBackdropPath() ),
          placeholder: AssetImage( 'assets/img/loading.gif' ),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _posterTitle( BuildContext context, Movie movie ) {

    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage( movie.getPosterImg() ),
              height: 150.0,
            ),
          ),
          SizedBox( width: 20.0 ),
          Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( movie.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis, ),
                  Text( movie.original_title, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis, ),
                  Row(
                    children: <Widget>[
                      Icon( Icons.star_border, ),
                      Text ( movie.vote_average.toString(), style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,)

                    ],
                  )
                ],
              )
          )
        ],
      ),
    );


  } // _posterTitle

  Widget _movieOverview(Movie movie) {

    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _createCasting( Movie movie) {

    final movieProvider = new MoviesProvider();


  } // _createCasting




} // MovieDetail

