import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_git/models/photo_model.dart'; 

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: ancho/13),
          child: FloatingActionButton(
            heroTag: 'favorite',
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Color.fromRGBO(75, 66, 255, 1),size: 39,),
            onPressed: (){},
          ),
        ),
        SizedBox(width: ancho/15,),
        FloatingActionButton(
          heroTag: 'download',
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_downward, color: Color.fromRGBO(75, 66, 255, 1),size: 39,),
          onPressed: () {},
        ),
        SizedBox(width: ancho/15,),
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
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            margin: EdgeInsets.symmetric(horizontal: ancho/25, vertical: largo/52),
            elevation: 10,
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