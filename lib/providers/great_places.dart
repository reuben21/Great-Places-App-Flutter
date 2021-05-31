import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {

    return [..._items];
  }

  Future<void> addPlace(String pickedTitle, File pickedImage) async {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: null);

    await DBProvider.db
        .insertPlaces(DateTime.now().toString(), pickedTitle, pickedImage.path);
    _items.add(newPlace);
    notifyListeners();
    await fetchAndSetPlaces();
  }

  Future<void> fetchAndSetPlaces() async {
    final places = await DBProvider.db.getPlaces();
    _items = places.map((item) => Place(
        id: item['id'],
        title: item['title'],
        location: null,
      image: File(item['image']))).toList();

  }
}