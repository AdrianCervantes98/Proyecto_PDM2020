import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';

class Details extends StatefulWidget {
  final ProductHamburguesas hamburguesa;
  final ProductHotdog hotdog;
  final ProductSnacks snack;
  Details({Key key, this.hamburguesa, this.hotdog, this.snack}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    var item;
    widget.hamburguesa != null ? item = widget.hamburguesa : widget.hotdog != null ? item = widget.hotdog: item = widget.snack;
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.productTitle}"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 400,
            height: 300,
            child: PhotoView(imageProvider: NetworkImage("${item.productImage}"
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Descripcion: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    "${item.productDescription}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Precio: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    "${item.productPrice}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Cantidad: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    "${item.productAmount}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Disponiblidad: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    item.available ? "Sí." : "No.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
