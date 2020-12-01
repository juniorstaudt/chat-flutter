import 'dart:io';

import 'package:chat_fiap_19mob/providers/my_places.dart';
import 'package:chat_fiap_19mob/widgets/image_input.dart';
import 'package:chat_fiap_19mob/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  LatLng _pickedLocation;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void __selectedLocation(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });
  }

  bool _isValid() {
    return !_titleController.text.isEmpty &&
        _pickedImage != null &&
        _pickedLocation != null;
  }

  void _submitForm() {
    if (!_isValid()) return;

    Provider.of<MyPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
      _pickedLocation,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar um local'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Nome do local',
                        ),
                      ),
                      SizedBox(height: 10),
                      ImageInput(this._selectImage),
                      SizedBox(height: 10),
                      LocationInput(this.__selectedLocation),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Adicionar imagem'),
              color: Theme.of(context).primaryColor,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: _isValid() ? _submitForm : null,
            )
          ],
        ));
  }
}
