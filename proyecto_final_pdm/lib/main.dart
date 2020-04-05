
import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/splashscreen.dart';

import 'splashscreen.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.black,
          ),
        ),
        cardColor: Colors.grey[300],
      ),
      home: Scaffold(
        body: SplashScreen(), 
      ),
    );
  }
}