import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/products/hotdogs/add_hotdogs/bloc/add_hotdogs_bloc.dart';
import 'package:proyecto_final_pdm/products/hotdogs/bloc/hotdogs_bloc.dart';

class AddHotdog extends StatefulWidget {
  AddHotdog({Key key}) : super(key: key);

  @override
  _AddHotdogState createState() => _AddHotdogState();
}

class _AddHotdogState extends State<AddHotdog> {
  File _chosenImage;
  bool available = true;
  String _url;
  bool _isLoading = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  AddHotdogsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar hotdog"),
      centerTitle: true,),
      body: BlocProvider(
        create: (context) {
          bloc = AddHotdogsBloc()..add(InitEvent());
          return bloc;
        },
        child: BlocListener<AddHotdogsBloc, AddHotdogsState>(
          listener: (context, state) {
            if (state is GetImageState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Obteniendo imagen..."),
                  ),
                );
            } else if (state is GetImageErrorState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Error al cargar la imagen."),
                  ),
                );
            } else if (state is UploadedFileState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Subiendo imagen..."),
                  ),
                );
            } else if (state is UploadedFileErrorState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Error al subir la imagen."),
                  ),
                );
            }
          },
          child: BlocBuilder<AddHotdogsBloc, AddHotdogsState>(
            builder: (context, state) {
              if (state is GetImageState) {
                _chosenImage = state.image;
              }
              if (state is UploadedFileState) {
                _url = state.image;
                _saveData();
              }
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: FractionalOffset.center,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _chosenImage != null
                              ? Image.file(
                                  _chosenImage,
                                  width: 150,
                                  height: 150,
                                )
                              : Container(
                                  height: 150,
                                  width: 150,
                                  child: Placeholder(
                                    fallbackHeight: 150,
                                    fallbackWidth: 150,
                                  ),
                                ),
                          SizedBox(height: 24),
                          MaterialButton(
                            color: Colors.indigo[100],
                            child: new Text("Agregar Imagen"),
                            onPressed: () {
                              bloc.add(ChooseImageEvent());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
                          ),
                          SizedBox(height: 24),
                          TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "Nombre del producto",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: _descriptionController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "Descripción del producto",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Precio del producto",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Número de productos en inventario",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  child: Text("Guardar"),
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    bloc.add(
                                        UploadFileEvent(image: _chosenImage));
                                  },
                                   shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      _isLoading ? CircularProgressIndicator() : Container(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _saveData() {
    BlocProvider.of<HotdogsBloc>(context).add(
      SaveDataEvent(
          productTitle: _titleController.text,
          productDescription: _descriptionController.text,
          productImage: _url,
          productPrice: int.parse(_priceController.text),
          productAmount: int.parse(_amountController.text),
          available: available),
    );
    _isLoading = false;
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      Navigator.of(context).pop();
    });
  }
}
