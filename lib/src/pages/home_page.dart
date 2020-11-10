import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cine_con_mojo_flutter_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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

      return CardSwiper(
        movies: [ 1, 2, 3, 4, 5, 6, 7 ],
      );

  } // _swiperTarjetas


} // HomePage


