import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';
import 'package:cine_con_mojo_flutter_app/src/widgets/lottie_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cine_con_mojo_flutter_app/src/providers/movies_provider.dart';
import 'package:cine_con_mojo_flutter_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            _swiperTarjetas()
          ],
        )
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
        future: moviesProvider.getInTheaters(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

          if ( snapshot.hasData ) {
            return CardSwiper( movies: snapshot.data );
          } else {
            return Container(
              height: 400.0,
                child: Center(
                    child: LottieAnimation('box_animation')
                )
            );
          }
        }
    );


  } // _swiperTarjetas


} // HomePage


