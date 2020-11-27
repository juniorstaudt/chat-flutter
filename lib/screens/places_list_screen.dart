import 'package:chat_fiap_19mob/providers/my_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus locais'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/place-form');
                })
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<MyPlaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshop) =>
              snapshop.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : Consumer<MyPlaces>(
                      child: Center(
                        child: Text('Nenhum local foi adicionado.'),
                      ),
                      builder: (ctx, myPlaces, chld) => myPlaces.itemsCount == 0
                          ? chld
                          : ListView.builder(
                              itemCount: myPlaces.itemsCount,
                              itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(myPlaces.itemByIndex(i).image),
                                ),
                                title: Text(myPlaces.itemByIndex(i).title),
                                onTap: () {},
                              ),
                            )),
        ));
  }
}
