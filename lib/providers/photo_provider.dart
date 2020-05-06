
import 'dart:convert';

import 'package:prueba_git/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotosProvider{
  String _apiKey = '563492ad6f917000010000015e6d523eb23e459c926be6fa5c094e53';
  String _url   = 'api.pexels.com';

  Future<List<Photo>> getCuratedPhotos() async{

    final url = Uri.https(_url, 'v1/curated', {
      'per_page'      : '15',
      'page'          : '1'
    });

    final response = await http.get(url, headers: {
      "Authorization" : _apiKey
    });
    final decodedData = json.decode(response.body);
    final photos = new Photos.fromJsonList(decodedData['photos']);
   
    return photos.items;

  }
}