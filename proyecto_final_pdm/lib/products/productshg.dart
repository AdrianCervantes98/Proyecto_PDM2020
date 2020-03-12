import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/comida/item_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';
import 'package:proyecto_final_pdm/products/products.dart';
import 'package:proyecto_final_pdm/products/productsSn.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

class ProductsHG extends StatefulWidget {
  final List<ProductHamburguesas> hamburguesasList;
  final List<ProductHotdog> hotdogList;
  final List<ProductSnacks> snackList;
  ProductsHG({Key key, @required this.hotdogList, @required this.hamburguesasList, @required this.snackList}) : super(key: key);

  @override
  _ProductsHGState createState() => _ProductsHGState();
}

class _ProductsHGState extends State<ProductsHG> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      drawer: _drawer(),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
            Padding(
             padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
             child: Text("Hotdogs",
             style: TextStyle(
               fontSize: 24,
             ),),
           ),
           Container(
             height: MediaQuery.of(context).size.height*0.329,
             child: ListView.builder(
               itemCount: hotdogList.length,
               itemBuilder: (BuildContext context, int index) {
               return ItemHotdog(hotdog: hotdogList[index]);
              },
             ),
           ),
         ],
      ),
    );
  }
  Widget _drawer() {
    return Drawer(
      child: Container(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text("El pichi",
              style: TextStyle(
                fontSize: 20,
              ),),
              leading: Icon(Icons.restaurant),
            ),

            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return Products(hamburguesasList: hamburguesasList,hotdogList: hotdogList,snakcList: snackList,);
                        }));
              },
              title: new Text("Hamburguesas",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),

            Divider(),
            ListTile(
              onTap: () {
              },
              title: new Text("Hotdogs",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),

            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return ProductsSn(snakcList: snackList,hotdogList: hotdogList,hamburguesasList: hamburguesasList,);
                        }));
              },
              title: new Text("Snacks",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              trailing: new Icon(Icons.restaurant_menu),
            ),
          ],
        ),
      ),
    );
  }
}

