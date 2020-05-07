import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_git/models/photo_model.dart';
import 'package:prueba_git/util/color_values.dart'; 

class ViewWallpaper extends StatelessWidget {
  final Photo photo ;
   ViewWallpaper({ this.photo}) ;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent
    ));

    final _pantalla = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorValues.backgroudColor,
      body: Column(
        children: <Widget>[
          _imagenBoton(_pantalla, context),
          _parteInferior(_pantalla),
        ],
      ),

      floatingActionButton: _botonesFlotantes(_pantalla),
    );
  }

  Widget _botonesFlotantes(Size _pantalla){

    final ancho = _pantalla.width;
    final largo = _pantalla.height;

    return Padding(
      padding:  EdgeInsets.only(left: ancho* 0.08),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          customFloatingButton(
            radius: 30,
            icon: Icon(Icons.favorite ,color: Color.fromRGBO(75, 66, 255, 1))
          ),
          customFloatingButton(
            radius: 30,
            icon: Icon(Icons.arrow_downward ,color: Color.fromRGBO(75, 66, 255, 1))
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.symmetric(horizontal: ancho/30, vertical: largo/60),
            child: Text('Apply Wallpaper', style: TextStyle(fontSize: ancho/20, color: Colors.white)),
            color: Color.fromRGBO(75, 66, 255, 1),
            onPressed: (){},
          )
        ],
      ),
    );
  }

  Widget _parteInferior(Size _pantalla){

    final ancho = _pantalla.width;
    final largo = _pantalla.height;

    return 
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: ancho/17,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('${photo.photographer}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: ancho/21)),
                padding: EdgeInsets.only( top: largo/25),
              ),
            
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Text('32.4k Downloads',style: TextStyle( fontSize: ancho/30, fontWeight: FontWeight.bold))
                ),
                margin: EdgeInsets.only( top: largo/25),
                padding: EdgeInsets.symmetric(horizontal: ancho/30, vertical: largo/170),
              )
            ],
          ),
        );
      
    
  }

  Widget customFloatingButton({double radius , Icon icon}){
    return Container(
      height:  radius*2,
      width:  radius*2,
      decoration: BoxDecoration(
        color: ColorValues.backgroudColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.0,
          color: ColorValues.ligthshadowColor
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(-4, -4),
            color: ColorValues.ligthshadowColor,
            blurRadius: 5.0
          ),
          BoxShadow(
            offset: Offset(4, 4),
            color: ColorValues.shadowColor,
            blurRadius: 5.0
          ),
        ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: icon)
        ],
      ),
    );
  }


  Widget _imagenBoton(Size _pantalla , context){ // Fondo de la pantalla, muestra el botón de atrás al igual que la foto.

    final ancho = _pantalla.width;
    final largo = _pantalla.height;

    return Stack(
      children: <Widget>[
        Hero(
          tag: photo.id,
          child: Image.network(photo.src.large, 
            fit: BoxFit.cover, 
            width: double.infinity,
            height: largo/1.3,
          ),
        ),
        SafeArea(
          child: Container(

            margin: EdgeInsets.symmetric(horizontal: ancho/25, vertical: largo/52),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: ColorValues.ligthshadowColor
              ),
              color: ColorValues.backgroudColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(-5, -5),
                  color: ColorValues.ligthshadowColor,
                  blurRadius: 15.0
                ),
                 BoxShadow(
                  offset: Offset(2,3),
                  color: Colors.black,
                  blurRadius: 4.0
                ),
                 BoxShadow(
                  offset: Offset(3, 3),
                  color: Color(0xFF576af8),
                  blurRadius: 4.0
                ),
              ],
              gradient: RadialGradient(
                
               
                colors: [
                  ColorValues.ligthshadowColor,
                  ColorValues.shadowColor,
                 
                ]
              )
            ),
            
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
              iconSize: ancho/13,
            ),
          ),
        ),
      ],
    );
  }
}