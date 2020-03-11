

import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_repository.dart';

List <ProductHamburguesas> hamburguesasList = ProductRepository.loadProducts(ProductType.HAMBURGUESAS);