import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/products/hotdogs/bloc/hotdogs_bloc.dart';

class ItemHotdog extends StatefulWidget {
  final ProductHotdog hotdog;
  final int index;
  ItemHotdog({Key key, @required this.hotdog, @required this.index})
      : super(key: key);

  @override
  _ItemHotdogState createState() => _ItemHotdogState();
}

class _ItemHotdogState extends State<ItemHotdog> {

  void _delete() {
    BlocProvider.of<HotdogsBloc>(context).add(
      RemoveDataEvent(index: widget.index),
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
                    "¡Eliminar Item!",
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
                  child: Text("¿Estas seguro?"),
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
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(5),
        color: Theme.of(context).cardColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipOval(
                child: Image.network(
                  '${widget.hotdog.productImage}',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Container(
                alignment: Alignment(0, 0),
                width: MediaQuery.of(context).size.width * 0.27,
                child: Text('${widget.hotdog.productDescription}',
                textAlign: TextAlign.center,)),
            Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${widget.hotdog.productTitle}'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text('\$${widget.hotdog.productPrice}'),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment(0, 0),
              width: MediaQuery.of(context).size.width * 0.15,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "Disponible",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Switch(
                      value: widget.hotdog.available,
                      onChanged: (value) {
                        setState(() {
                          widget.hotdog.available = value;
                        });
                      }),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _dialog();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
