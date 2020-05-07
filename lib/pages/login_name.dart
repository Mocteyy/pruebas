import 'package:flutter/material.dart';

class LoginName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(fontFamily: 'MoonBold')
          )
        ),
        child: Stack(
        children: <Widget>[
          _gradiente(),
          Center(child: Text('Bienvenido',))
        ],
        ),
      ),
    );
  }

  Container _gradiente(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(1, 0.0),
          end: FractionalOffset(0.0, 1),
          colors: [
            Color.fromRGBO(70, 255, 207, 1),Color.fromRGBO(34, 228, 255, 1)
          ]
        )
      ),
    );
  }
}