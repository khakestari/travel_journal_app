import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// import '../models/constants.dart';

const GOOGLE_API_KEY = 'AIzaSyCFVMQcLk3x6ehkV7pKwAMBlI7ixuFHW1I';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(
      {required double latitude, required double longitude}) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    if (kDebugMode) {
      print(json.decode(response.body)['results'][0]['formatted_address']);
    }
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
