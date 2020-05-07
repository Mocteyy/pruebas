import 'package:flutter/material.dart';
import 'package:prueba_git/pages/home_page.dart';
import 'package:prueba_git/pages/login_name.dart';
//import 'package:prueba_git/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sans'
      ),
      debugShowCheckedModeBanner: false,
      //aqui en el home pones la pagina que tu estas haciendo para poder visualizarla
      home: LoginName(),
    )
  );
}