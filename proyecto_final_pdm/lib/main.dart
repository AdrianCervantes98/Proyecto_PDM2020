
import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/mapa/mapa.dart';
import 'package:proyecto_final_pdm/products/products.dart';
import 'package:proyecto_final_pdm/profile/aboutUs.dart';
import 'package:proyecto_final_pdm/splashscreen.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

import 'splashscreen.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SplashScreen(), 
      ),
    );
  }
}