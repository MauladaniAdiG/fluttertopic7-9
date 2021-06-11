import 'package:http/http.dart' as http;
import 'package:app/model/photo.dart';
import 'dart:convert';

class ServiceApi {
  final String baseUrl = 'https://api.pexels.com/v1';
  final String keyPexels = '563492ad6f91700001000001e2af086c5aef4f90a567ffdbc3c7cce9';

  Future getPhotoSource(String page, String perPage) async {
    http.Response response = await http.get(Uri.parse('$baseUrl/curated?page=$page&per_page=$perPage'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $keyPexels'
    });
    if (response.statusCode == 200) {
      return Photo.getPhotoList(json.decode(response.body));
    } else {
      return null;
    }
  }
}
