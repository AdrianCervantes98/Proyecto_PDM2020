
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';

enum ProductType{HAMBURGUESAS, HOTDOGS, SNACKS}

class ProductRepository {
  static List<dynamic> loadProducts(ProductType productType){
    if(productType == ProductType.HAMBURGUESAS){
      return <ProductHamburguesas> [
        ProductHamburguesas(
          productTitle: "Hawaiana",
          productAmount: 100,
          productDescription: "Piña, jamón y queso",
          productImage: "https://i0.pngocean.com/files/623/62/539/hamburger-cheeseburger-buffalo-burger-breakfast-sandwich-fast-food-hamburger-menu.jpg",
          available: true,
          productPrice: 50,
        ),
        ProductHamburguesas(
          productTitle: "Porky",
          productAmount: 100,
          productDescription: "Jamón, chorizo, salchicha, queso.",
          productImage: "https://i0.pngocean.com/files/623/62/539/hamburger-cheeseburger-buffalo-burger-breakfast-sandwich-fast-food-hamburger-menu.jpg",
          available: true,
          productPrice: 60
        ),
        ProductHamburguesas(
          productTitle: "Bacon",
          productAmount: 100,
          productDescription: "Tocino, aros de cebolla.",
          productImage: "https://i0.pngocean.com/files/623/62/539/hamburger-cheeseburger-buffalo-burger-breakfast-sandwich-fast-food-hamburger-menu.jpg",
          available: true,
          productPrice: 60
        ),
      ];
    }
    if(productType == ProductType.HOTDOGS){
      return <ProductHotdog> [
        ProductHotdog(
          productTitle: "Clasico",
          productAmount: 100,
          productDescription: "Jitomate, cebolla",
          productImage: "https://www.kindpng.com/picc/m/53-530027_bacon-hot-dog-transparent-transparent-hot-dog-png.png",
          available: true,
          productPrice: 25,
        ),
        ProductHotdog(
          productTitle: "Hawaiano",
          productAmount: 100,
          productDescription: "Piña, queso, cebolla",
          productImage: "https://www.kindpng.com/picc/m/53-530027_bacon-hot-dog-transparent-transparent-hot-dog-png.png",
          available: true,
          productPrice: 35,
        ),
      ];
    }
    if(productType == ProductType.SNACKS){
        return <ProductSnacks> [
        ProductSnacks(
          productTitle: "Nuggets",
          productAmount: 100,
          productDescription: "Dip Queso",
          productImage: "https://p7.hiclipart.com/preview/272/891/631/mcdonald-s-chicken-mcnuggets-chicken-nugget-french-fries-nuggets.jpg",
          available: true,
          productPrice: 70,
        ),
        ProductSnacks(
          productTitle: "Papas",
          productAmount: 100,
          productDescription: "Dip bbq",
          productImage: "https://www.stickpng.com/assets/images/585ac0544f6ae202fedf2939.png",
          available: true,
          productPrice: 45,
        ),
      ];
    }

  }



  
}