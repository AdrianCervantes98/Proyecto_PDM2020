

import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_repository.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';

List <ProductHamburguesas> hamburguesasList = ProductRepository.loadProducts(ProductType.HAMBURGUESAS);
List <ProductHotdog> hotdogList = ProductRepository.loadProducts(ProductType.HOTDOGS);
List <ProductSnacks> snackList = ProductRepository.loadProducts(ProductType.SNACKS);