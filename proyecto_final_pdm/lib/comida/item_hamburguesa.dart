import 'package:flutter/material.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';

class ItemHamburguesa extends StatefulWidget {
  final ProductHamburguesas hamburguesa;
  ItemHamburguesa({Key key, @required this.hamburguesa}) : super(key: key);

  @override
  _ItemHamburguesaState createState() => _ItemHamburguesaState();
}

class _ItemHamburguesaState extends State<ItemHamburguesa> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment(0, 0),
            width: MediaQuery.of(context).size.width*0.25,
             child: ClipOval(
               child: Image.network(
                '${widget.hamburguesa.productImage}',
                height: 100,
                width: 100,
            ),
             ),
          ),
          Container(
            alignment: Alignment(0, 0),
            width: MediaQuery.of(context).size.width*0.27,
            child: Text('${widget.hamburguesa.productDescription}')),
          Container(
           
            width: MediaQuery.of(context).size.width*0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${widget.hamburguesa.productTitle}'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('\$${widget.hamburguesa.productPrice}'),
                ),
              ],
            )),
          Container(
            alignment: Alignment(0, 0),
            width: MediaQuery.of(context).size.width*0.15,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Disponible",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Switch(value: widget.hamburguesa.available, onChanged: (value){
                  setState(() {
                    widget.hamburguesa.available = value;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
