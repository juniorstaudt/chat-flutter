import 'package:chat_fiap_19mob/screens/auth_screen.dart';
import 'package:chat_fiap_19mob/screens/chat_screen.dart';
import 'package:chat_fiap_19mob/screens/maps_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _init = Firebase.initializeApp();

    return FutureBuilder(
      future: _init,
      builder: (ctx, appSnapshot) {
        return MaterialApp(
          title: 'Flutter Chat',
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/maps': (BuildContext context) => new MapScreen(),
          },
          theme: ThemeData(
            primarySwatch: Colors.pink,
            backgroundColor: Colors.pink,
            accentColor: Colors.deepPurple,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return ChatScreen();
              } else {
                return AuthScreen();
              }
            },
          ),
        );
      },
    );
  }
}
