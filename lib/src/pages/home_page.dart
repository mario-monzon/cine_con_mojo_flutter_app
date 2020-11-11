import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';
import 'package:cine_con_mojo_flutter_app/src/widgets/lottie_animation_widget.dart';
import 'package:cine_con_mojo_flutter_app/src/widgets/movie_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cine_con_mojo_flutter_app/src/providers/movies_provider.dart';
import 'package:cine_con_mojo_flutter_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {

    moviesProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text( 'Películas en Cines' ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){})
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            _footerInfiniteScroll(context)
          ],
        )
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
        future: moviesProvider.getInTheaters(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return snapshot.hasData ? CardSwiper( movies: snapshot.data ) : Center(child: LottieAnimation('box_animation'));
        }
    );


  } // _swiperTarjetas

  Widget _footerInfiniteScroll(BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
              child: Text( 'Populares', style: Theme.of(context).textTheme.subtitle1, )),
          SizedBox(height: 5.0,),
          StreamBuilder(
              stream: moviesProvider.popularMoviesStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

                snapshot.data?.forEach( (p) => print(p.title) );

                if ( snapshot.hasData )  {
                  return MovieHorizontal(
                      movies: snapshot.data,
                      nextPage: moviesProvider.getPopular,
                  );
                } else {
                   return Center( child: CircularProgressIndicator() );
                }
              },
          ),
        ],
      ),
    );
  }


} // HomePage


