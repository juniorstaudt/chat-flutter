import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latidude;
  final double longitude;
  final String address;

  PlaceLocation({
    @required this.latidude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
