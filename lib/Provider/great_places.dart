import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:where_iam_i/helpers/db_helper.dart';
import 'package:where_iam_i/helpers/location_helper.dart';
import 'package:where_iam_i/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(
    String title,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitute);
    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitute: pickedLocation.longitute,
        address: address);
    // PlaceLocation(
    //     pickedLocation.latitude, pickedLocation.longitute, address);
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: updatedLocation,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitute,
      'address': newPlace.location!.address,
    });
  }

  Future<void> fethAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(
                latitude: item['loc_data'],
                longitute: item['loc_lng'],
                address: item['address']),
            image: File(item['image']),
          ),
        )
        .toList();
  }
}
