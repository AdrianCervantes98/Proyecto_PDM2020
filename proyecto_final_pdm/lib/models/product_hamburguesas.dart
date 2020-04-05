import 'package:flutter/foundation.dart';
class ProductHamburguesas {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  int productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool available;

  ProductHamburguesas({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productAmount,
    @required this.available,
    @required this.productPrice
  }) {
    
  }
}