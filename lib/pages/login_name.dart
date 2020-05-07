import 'package:flutter/material.dart';
import 'package:prueba_git/pages/home_page.dart';
import 'package:prueba_git/util/color_values.dart';

class LoginName extends StatelessWidget {



  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final _pantalla = MediaQuery.of(context).size;
    final ancho = _pantalla.width;
    final largo = _pantalla.height;

    return Scaffold(
      body:  Stack(
        children: <Widget>[
          _gradiente(),
          SafeArea(
            child: Container(
              
              padding: EdgeInsets.only(left: ancho/15, top: ancho/15),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bienvenido!" , style: TextStyle(fontFamily: 'moon', fontWeight: FontWeight.bold, color: Colors.white, fontSize: ancho/10, letterSpacing: 1.5),),
                  SizedBox(height: largo/5,),
                  Text("¿Cual es tu nombre?" , style: TextStyle(fontFamily: 'moon', fontWeight: FontWeight.bold, color: Colors.white, fontSize: ancho/17, letterSpacing: 1.5),),
                  SizedBox(height: largo/15,),
                  _boton(_pantalla, context)
                ],
              ),
            ),
          )
        ],
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
          end: FractionalOffset(0.7, 1),
          colors: [
            Color.fromRGBO(160, 76, 255, 1),
            Color.fromRGBO( 72, 39, 185, 1)
          ]
        )
      ),
    );
  }



  Container _boton(Size _pantalla, BuildContext context){

    final ancho = _pantalla.width;
    final largo = _pantalla.height;

    



    return Container(
      padding: EdgeInsets.symmetric(horizontal: ancho* 0.09),
      width: ancho/1.17,
      height: largo * 0.07,
      decoration: BoxDecoration(
        color: Color.fromRGBO(182, 100, 182, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            color: Colors.black26,
            blurRadius: 5.0
          ),
          BoxShadow(
            offset: Offset(0, 6),
            color: Colors.black26,
            blurRadius: 5.0
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Mi llamo...',
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  fontFamily: 'moon',
                  fontSize: ancho * 0.05,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(controller.text)));
            },
          )
        ],
      ),
    );
  }
}