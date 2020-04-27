import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proyecto_final_pdm/models/photo.dart';

class PhotoDetails extends StatefulWidget {
  final Photo photo;
  PhotoDetails({Key key, this.photo}) : super(key: key);

  @override
  _PhotoDetailsState createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.photo.nombre}"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 400,
            height: 300,
            child: PhotoView(
              imageProvider: NetworkImage("${widget.photo.imageUrl}"),
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
                    "${widget.photo.descripcion}",
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
