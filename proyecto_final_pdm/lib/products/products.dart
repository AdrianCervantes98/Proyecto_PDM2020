import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/comida/item_hamburguesa.dart';
import 'package:proyecto_final_pdm/comida/item_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';
import 'package:proyecto_final_pdm/products/productsSn.dart';
import 'package:proyecto_final_pdm/products/productshg.dart';
import 'package:proyecto_final_pdm/profile/profile.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

class Products extends StatefulWidget {
  final List<ProductHamburguesas> hamburguesasList;
  final List<ProductHotdog> hotdogList;
  final List<ProductSnacks> snakcList;
  Products({Key key, @required this.hamburguesasList, @required this.hotdogList, @required this.snakcList}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  
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
             child: Text("Hamburguesas",
             style: TextStyle(
               fontSize: 24,
             ),),
           ),
           Container(
             height: MediaQuery.of(context).size.height*0.666,
             child: ListView.builder(
               itemCount: hamburguesasList.length,
               itemBuilder: (BuildContext context, int index) {
               return ItemHamburguesa(hamburguesa: hamburguesasList[index]);
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
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return ProductsHG(hamburguesasList: hamburguesasList,hotdogList: hotdogList,snackList: snackList);
                        }));
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

