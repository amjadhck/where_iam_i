import 'package:http/http.dart' as http;
import 'dart:convert';

const googleApiKey = 'AIzaSyCKDJGtV2k1afdCre09rp_QpnXO-VNREEw';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double? latitide, required double? longitude}) {
    return '''https://maps.googleapis.com/maps/api/staticmap?
    center=$latitide,$longitude&zoom=16&size=600x300
    &maptype=roadmap&markers=color:red
    %7Clabel:A%7C$latitide,$longitude
    &key=$googleApiKey''';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final Uri url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=$googleApiKey'
            as Uri;
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
