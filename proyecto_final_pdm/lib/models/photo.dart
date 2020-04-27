import 'package:flutter/foundation.dart';

class Photo {
  final String nombre;
  final String descripcion;
  final String imageUrl;

  Photo({
    @required this.nombre,
    @required this.descripcion,
    @required this.imageUrl,
  });
}