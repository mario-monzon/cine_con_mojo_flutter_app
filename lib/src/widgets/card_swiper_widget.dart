import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cine_con_mojo_flutter_app/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  CardSwiper({ @required this.movies});

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage( movies[index].getPosterImg() ),
              placeholder: AssetImage( 'assets/img/loading.gif' ),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: movies.length,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }

} // CardSwiper

// posterUrlImages = https://image.tmdb.org/t/p/w500