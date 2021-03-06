import 'package:flutter/material.dart';
import 'package:prueba_git/models/photo_model.dart';
import 'package:prueba_git/pages/view_wallpaper.dart';
import 'package:prueba_git/util/color_values.dart';

class CardSwiper extends StatelessWidget {
  final List<Photo> photos ;
  final VoidCallback callNextPage;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.6,
  );

   CardSwiper({@required this.photos,@required this.callNextPage});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    _pageController.addListener(() { 
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 100.0){
        callNextPage();
      }
    });

    return Container(
      height:  height * 0.50,
      child: PageView.builder(
        itemCount: photos.length,
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: (context, index){
          return CustomCard(
          photo: photos[index],
          );
        },
        
      ),
    );
  }

 
}

class CustomCard extends StatelessWidget {
  final Photo photo;

   CustomCard({ this.photo});
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewWallpaper(
              photo: photo,
        )));
      },
         child: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.05,
          ),
           Container(
              height: height * 0.35,
              width: width * 0.50,
             padding: EdgeInsets.all(height *0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorValues.backgroudColor,
                boxShadow: [
                  BoxShadow(
                    offset:  Offset(-5, -5),
                    color: ColorValues.ligthshadowColor,
                    blurRadius: 3.0
                  ),
                  BoxShadow(
                    offset:  Offset(5, 5),
                    color: ColorValues.shadowColor,
                    blurRadius: 3.0
                  )
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Expanded(
                     child: Hero(
                       tag: photo.id,
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           image: DecorationImage(
                             image: NetworkImage(photo.src.medium),
                             fit: BoxFit.cover
                           )
                         ),
                          width: double.infinity,
                        ),
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('${photo.photographer}' , 
                    style: TextStyle(
                      fontFamily: 'moon',
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0
                    ),
                    ),
                  )
                ],
              )
            ),
          SizedBox(
            height: height * 0.10,
          )
        ],
      ),
    );
  }
}