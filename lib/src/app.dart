import 'package:flutter/material.dart';
import 'package:cine_con_mojo_flutter_app/src/pages/home_page.dart';
import 'package:cine_con_mojo_flutter_app/src/pages/movie_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cine con Mojo',
      initialRoute: '/',
      routes: {
        '/': ( BuildContext context ) => HomePage(),
        'detalle': ( BuildContext context ) => MovieDetail(),
      },
    );
  }
}