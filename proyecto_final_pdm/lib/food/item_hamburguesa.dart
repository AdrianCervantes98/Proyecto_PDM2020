import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/products/details/details.dart';
import 'package:proyecto_final_pdm/products/hamburgers/bloc/hamburgers_bloc.dart';

class ItemHamburguesa extends StatefulWidget {
  final ProductHamburguesas hamburguesa;
  final int index;
  ItemHamburguesa({Key key, @required this.hamburguesa, @required this.index}) : super(key: key);

  @override
  _ItemHamburguesaState createState() => _ItemHamburguesaState();
}

class _ItemHamburguesaState extends State<ItemHamburguesa> {

  void _delete() {
    BlocProvider.of<HamburgersBloc>(context).add(
      RemoveDataEvent(index: widget.index),
    );
  }

  void _detail(ProductHamburguesas hamburguesa){
     Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Details(hamburguesa: hamburguesa,))
    );
  }

  _dialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "¡Eliminar Producto!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text("¿Estás seguro?"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  child: new Text("ACEPTAR"),
                  onPressed: () {
                    _delete();
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("CANCELAR"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
          child: GestureDetector(
             onTap: (){
        _detail(widget.hamburguesa);
      },
                      child: Card(
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
                width: MediaQuery.of(context).size.width * 0.25,
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
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Text('${widget.hamburguesa.productDescription}', 
                  textAlign: TextAlign.center,)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                width: MediaQuery.of(context).size.width * 0.15,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "Disponible",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch(
                        value: widget.hamburguesa.available,
                        onChanged: (value) {
                          setState(() {
                            widget.hamburguesa.available = value;
                          });
                        }),
                        IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _dialog();
                        }),
                  ],
                ),
              ),
            ],
        ),
      ),
          ),
    );
  }
}
