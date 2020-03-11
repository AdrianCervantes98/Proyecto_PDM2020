import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/comida/item_hamburguesa.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/utils/constants.dart';

class Products extends StatefulWidget {
  final List<ProductHamburguesas> hamburguesasList;
  Products({Key key, @required this.hamburguesasList}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
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
             height: MediaQuery.of(context).size.height*0.7,
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
}

Widget _drawer() {
    return Drawer(
      child: Container(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text("Restaurantes",
              style: TextStyle(
                fontSize: 20,
              ),),
              leading: Icon(Icons.restaurant),
            ),
            Divider(),
            ListTile(
              onTap: () {
              },
              title: new Text("El pichi",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              trailing: new Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }