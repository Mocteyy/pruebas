import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ViewPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: _swipierImages(),
            )
          ],
        ),
      ),

    );
  }

 Container _swipierImages() {
    return  Container(
      width: double.infinity,
      height: 200.0,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 200.0,
        itemHeight: 500.0,
          itemBuilder: (BuildContext context,int index){
            return  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Mantid_August_2007-2.jpg/1200px-Mantid_August_2007-2.jpg",fit: BoxFit.fill,);
          },
          itemCount: 3,
         
          

        ),
    );
  }
}