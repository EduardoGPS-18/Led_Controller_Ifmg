import 'package:flutter/material.dart';
import './views/AuthScreen.dart';
import './views/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => AuthScreen(),
        "/home": (_) => HomeScreen(),
      },
      initialRoute: "/",
    );
  }
}
