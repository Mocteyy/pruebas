
class Photos{

  List<Photo> items = new List();
  Photos();

  Photos.fromJsonList( List<dynamic> jsonList){
    
    if(jsonList == null) return;

    for (var item in jsonList) {
      final Photo photo = new Photo.fromJsonMap(item);
      items.add(photo);
    }
  }

}


class Photo {
  int id;
  int width;
  int height;
  String photographer;
  
  
  Src src;
  bool liked;

  Photo({
    this.id,
    this.width,
    this.height,
    this.photographer,
    this.src,
    this.liked,
  });


  Photo.fromJsonMap(Map<String, dynamic> response){
    id           = response['id'];
    width        = response['width'];
    height       = response['height'];
    photographer = response['photographer'];
    src          = Src.fromJson(response['src']);
    liked        = response['liked'];

  } 

}

class Src {
  String original;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;

  Src({
    this.original,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
  });

  Src.fromJson(Map<String, dynamic> src){
    original    =   src['original'];
    large       =   src['large'];
    medium      =   src['medium'];
    small       =   src['small'];
    portrait    =   src['portrait'];
    landscape   =   src['landscape'];

  }
}
