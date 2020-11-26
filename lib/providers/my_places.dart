import 'package:chat_fiap_19mob/models/place.dart';
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
}
