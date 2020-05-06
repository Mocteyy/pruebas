import 'package:flutter/material.dart';
import 'package:prueba_git/pages/view_photos.dart';
//import 'package:prueba_git/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //aqui en el home pones la pagina que tu estas haciendo para poder visualizarla
      home: ViewPhotos(),
    )
  );
}