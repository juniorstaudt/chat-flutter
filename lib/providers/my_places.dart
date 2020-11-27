import 'dart:io';
import 'dart:math';

import 'package:chat_fiap_19mob/models/place.dart';
import 'package:chat_fiap_19mob/utils/db_util.dart';
import 'package:flutter/material.dart';

class MyPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get itesm {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPlace);

    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });

    notifyListeners();
  }
}
