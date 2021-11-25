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
}
