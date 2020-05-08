import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/models/photo.dart';
import 'package:proyecto_final_pdm/photos/photo_detail.dart';

import 'bloc/photo_bloc.dart';

class ItemPhotos extends StatefulWidget {
  final String imageUrl;
  final String nombre;
  final String descripcion;
  final int index;
  ItemPhotos({
    Key key,
    @required this.imageUrl,
    @required this.index,
    @required this.nombre,
    @required this.descripcion,
  }) : super(key: key);

  @override
  _ItemPhotosState createState() => _ItemPhotosState();
}

class _ItemPhotosState extends State<ItemPhotos> {

  void _delete() {
    BlocProvider.of<PhotoBloc>(context).add(
      RemoveDataEvent(index: widget.index),
    );
  }

  void _detail(String url, String nombre, String descripcion){
    Photo ph = Photo(descripcion: descripcion, nombre: nombre, imageUrl: url);
     Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PhotoDetails(photo: ph))
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
                    "¡Eliminar Foto!",
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
    return GestureDetector(
      onTap: (){
        _detail(widget.imageUrl, widget.nombre, widget.descripcion);
      },
          child: Card(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _dialog();
                  },
                )
              ],
            ),
            Image.network(
              widget.imageUrl ?? "https://via.placeholder.com/150",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            Container(
              child: Text(
                "${widget.nombre}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text("${widget.descripcion}"),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
