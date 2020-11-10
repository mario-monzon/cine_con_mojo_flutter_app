import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> movies;

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
            child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,),
          );
        },
        itemCount: movies.length,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }

} // CardSwiper


// APIKey = 6b620a8ab956bb4d6bdf7f8edc5c070b
// posterUrlImages = https://image.tmdb.org/t/p/w500