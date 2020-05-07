
import 'dart:async';
import 'dart:convert';
import 'package:prueba_git/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotosProvider{
  String _apiKey = '563492ad6f917000010000015e6d523eb23e459c926be6fa5c094e53';
  String _url    = 'api.pexels.com';

  int _page      = 0;
  bool _isLoading  = false;

  List<Photo> _photos = new List();

  final _photosStream = StreamController<List<Photo>>.broadcast();

  Function(List<Photo>) get popularPhotosSink =>_photosStream.sink.add;
  Stream<List<Photo>> get popularPhotosStream =>_photosStream.stream;

  void dispose(){
    _photosStream?.close();
  }



  Future<List<Photo>> getCuratedPhotos() async{

    if(_isLoading) return [];
    _isLoading = true;

    _page++;

    final url = Uri.https(_url, 'v1/curated', {
      'per_page'      : '15',
      'page'          : _page.toString()
    });

    final response = await http.get(url, headers: {
      "Authorization" : _apiKey
    });
    final decodedData = json.decode(response.body);
    final photos = new Photos.fromJsonList(decodedData['photos']);
    final resp = photos.items;
   
    _photos.addAll(resp);
    popularPhotosSink(_photos);
    _isLoading = false;
    return resp;

  }
}