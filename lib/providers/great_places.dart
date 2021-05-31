import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {

  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(), title: pickedTitle, image: pickedImage,location: null);

    _items.add(newPlace);
    notifyListeners();
  }


}