import 'package:chat_fiap_19mob/models/place.dart';
import 'package:chat_fiap_19mob/screens/maps_screen.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            place.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    isReadyOnly: true,
                    initialLocation: place.location,
                  ),
                ),
              );
            },
            icon: Icon(Icons.map),
            label: Text('Ver no mapa'),
          ),
        ],
      ),
    );
  }
}
