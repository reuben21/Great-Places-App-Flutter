import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/helpers/location_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(String pickedTitle, File pickedImage,
      PlaceLocation pickedLocation) async {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: pickedLocation);


    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);

    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address.toString());


    await DBProvider.db.insertPlaces(
        DateTime.now().toString(),
        pickedTitle,
        pickedImage.path,
        updatedLocation.latitude,
        updatedLocation.longitude,
        updatedLocation.address);
    _items.add(newPlace);
    notifyListeners();
    await fetchAndSetPlaces();
  }

  Future<void> fetchAndSetPlaces() async {
    final places = await DBProvider.db.getPlaces();
    _items = places
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(
                latitude:  item['loc_lat'],
                longitude: item['loc_lng'],
                address: item['address'],),
            image: File(item['image'])))
        .toList();
  }
}
