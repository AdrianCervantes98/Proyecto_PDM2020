import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pdm/models/photo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final Firestore _firestoreInstance = Firestore.instance;
  List<Photo> _photosList;
  List<DocumentSnapshot> _documentsList;
  List<Photo> get getPhotosList => _photosList;
  
  @override
  PhotoState get initialState => PhotoInitial();

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is GetDataEvent) {
      bool dataRetrieved = await _getData();
      if (dataRetrieved)
        yield CloudStoreGetData();
      else
        yield CloudStoreError(
          errorMessage: "No se ha podido conseguir datos.",
        );
    } else if (event is SaveDataEvent) {
      bool saved = await _savePhoto(
        event.nombre,
        event.descripcion,
        event.imageUrl,
      );
      if (saved) {
        await _getData();
        yield CloudStoreSaved();
      } else
        yield CloudStoreError(
          errorMessage: "Ha ocurrido un error. Intente guardar mas tarde.",
        );
    } else if (event is RemoveDataEvent) {
      try {
        await _documentsList[event.index].reference.delete();
        _documentsList.removeAt(event.index);
        _photosList.removeAt(event.index);
        yield CloudStoreRemoved();
      } catch (err) {
        yield CloudStoreError(
          errorMessage: "Ha ocurrido un error. Intente borrar mas tarde.",
        );
      }
    }
  }

Future<bool> _getData() async {
    try {
      var photos =
          await _firestoreInstance.collection("photos").getDocuments();
      _photosList = photos.documents
          .map(
            (photo) => Photo(
              nombre: photo["nombre"],
              descripcion: photo["descripcion"],
              imageUrl: photo["imagen"],
            ),
          )
          .toList();
      _documentsList = photos.documents;
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> _savePhoto(
    String nombre,
    String descripcion,
    String imageUrl,
  ) async {
    try {
      await _firestoreInstance.collection("photos").document().setData({
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imageUrl,
      });
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

}
