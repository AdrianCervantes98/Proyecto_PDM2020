import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_pdm/photos/add_photo/add_photo.dart';
import 'package:proyecto_final_pdm/photos/bloc/photo_bloc.dart';
import 'package:proyecto_final_pdm/photos/item_photos.dart';

class Photos extends StatefulWidget {
  Photos({Key key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  PhotoBloc bloc;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fotografías"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: bloc,
                child: AddPhoto(),
              ),
            ),
          );
        },
        label: Text("Agregar"),
        icon: Icon(Icons.add_box),
      ),
      body: BlocProvider(
        create: (context) {
          bloc = PhotoBloc()..add(GetDataEvent());
          return bloc;
        },
        child: BlocListener<PhotoBloc, PhotoState>(
          listener: (context, state) {
            if (state is CloudStoreRemoved) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Se ha eliminado el elemento."),
                  ),
                );
            } else if (state is CloudStoreError) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("${state.errorMessage}"),
                  ),
                );
            } else if (state is CloudStoreSaved) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Se ha guardado el elemento."),
                  ),
                );
            } else if (state is CloudStoreGetData) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Descargando datos..."),
                  ),
                );
            }
          },
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: bloc.getPhotosList.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ItemPhotos(
                    key: UniqueKey(),
                    index: index,
                    imageUrl: bloc.getPhotosList[index].imageUrl,
                    nombre: bloc.getPhotosList[index].nombre ?? "No name",
                    descripcion: bloc.getPhotosList[index].descripcion ??
                        "No description",
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
