import 'package:flutter/material.dart';
import 'package:prueba_git/models/photo_model.dart';
import 'package:prueba_git/providers/photo_provider.dart';
import 'package:prueba_git/util/color_values.dart';
import 'package:prueba_git/widgtes/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
   final PhotosProvider photosProvider = new PhotosProvider();
   
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorValues.backgroudColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: height * 0.10,
          left: width * 0.05,
          right: width * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buidHeader(width, height),
            Text('Popular',
                  style: TextStyle(
                  fontFamily: 'moon',
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                ),
              ),
              _buildCardSwiper()
              

          ],
        )
      ),
    );
  }


  _buidHeader(double width, double height){
    return Column(
          mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Text('Hi Luis!',
                  style: TextStyle(
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07
                ),
              ),
              SizedBox(height: height * 0.02),
              Text('Best wallapers for you',
                  style: TextStyle(
                  fontFamily: 'moon',
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                ),
              ),
              SizedBox(height: height * 0.04),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width* 0.09),
                width: double.infinity,
                height: height * 0.07,
                decoration: BoxDecoration(
                  color: ColorValues.backgroudColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -5),
                      color: ColorValues.shadowColor,
                      blurRadius: 5.0
                    ),
                    BoxShadow(
                      offset: Offset(0, 6),
                      color: ColorValues.ligthshadowColor,
                      blurRadius: 5.0
                    )
                  ]
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'buscar',
                          hintStyle: TextStyle(
                          fontFamily: 'moon',
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0
                        ),
                        ),
                      ),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
      );
  }

  _buildCardSwiper() {
    return FutureBuilder(
      future: photosProvider.getCuratedPhotos(),
      builder: (BuildContext context , AsyncSnapshot<List<Photo>> snapshot){
       if(snapshot.hasData){
        return CardSwiper(photos: snapshot.data);
       }else
       return Center(child: CircularProgressIndicator());
      },
    );
  }



}