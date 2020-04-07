
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/authentication/bloc/authentication_bloc.dart';
import 'package:proyecto_final_pdm/splashscreen.dart';

import 'splashscreen.dart';

void main() async {
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(VerifyAuthenticatedUser()),
      child: MyApp(),
    ),
  );
}
 
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