import 'package:chat_fiap_19mob/widgets/messages.dart';
import 'package:chat_fiap_19mob/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'locations',
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.map),
                        SizedBox(width: 8),
                        Text('Meus lugares'),
                      ],
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'sum',
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.calculate),
                        SizedBox(width: 8),
                        Text('Somador'),
                      ],
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 8),
                        Text('Sair'),
                      ],
                    ),
                  ),
                )
              ],
              onChanged: (item) {
                if (item == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
                if (item == 'locations') {
                  Navigator.pushNamed(context, '/places-list');
                } else {
                  if (item == 'sum') {
                    Navigator.pushNamed(context, '/sum-screen');
                  }
                }
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
