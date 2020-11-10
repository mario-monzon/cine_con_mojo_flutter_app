import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {

  String animation;

  LottieAnimation( this.animation );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.asset('lib/res/lottie/${animation}.json'),
      ),
    );
  }
}
