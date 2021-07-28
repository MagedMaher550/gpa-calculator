import 'package:flutter/material.dart';
import 'main.dart';
import 'settings.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: MyApp.id,
      routes: {
        MyApp.id: (context) => MyApp(),
        MySettings.id: (context) => MySettings(),
      },
    );
  }
}
