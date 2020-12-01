import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:chat_fiap_19mob/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadyOnly;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latidude: 37.419857,
      longitude: -122.078827,
    ),
    this.isReadyOnly = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickerPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickerPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione um local'),
        actions: <Widget>[
          if (!widget.isReadyOnly)
            IconButton(
                icon: Icon(Icons.check),
                onPressed: _pickerPosition == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickerPosition);
                      }),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latidude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadyOnly ? null : _selectPosition,
        markers: (_pickerPosition == null && !widget.isReadyOnly)
            ? null
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position:
                      _pickerPosition ?? widget.initialLocation.toLatLong(),
                ),
              },
      ),
    );
  }
}
