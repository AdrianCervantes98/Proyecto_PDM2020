import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pdm/models/product_hamburguesas.dart';

part 'hamburgers_event.dart';
part 'hamburgers_state.dart';

class HamburgersBloc extends Bloc<HamburgersEvent, HamburgersState> {
  final Firestore _firestoreInstance = Firestore.instance;
  List<ProductHamburguesas> _hamburgersList;
  List<DocumentSnapshot> _documentsList;
  List<ProductHamburguesas> get getHamburgersList => _hamburgersList;

  @override
  HamburgersState get initialState => HamburgersInitial();

  @override
  Stream<HamburgersState> mapEventToState(
    HamburgersEvent event,
  ) async* {
    if (event is GetDataEvent) {
      bool dataRetrieved = await _getData();
      if (dataRetrieved) {
        yield CloudStoreGetData();
      } else {
        yield CloudStoreGetDataError(
            errorMessage: "No se pudo obtener la lista de productos.");
      }
    } else if (event is SaveDataEvent) {
      bool saved = await _saveHamburger(
        event.productTitle,
        event.productDescription,
        event.productImage,
        event.productPrice,
        event.productAmount, 
        event.available
      );
      if (saved) {
        await _getData();
        yield CloudStoreSaved();
      } else
        yield CloudStoreGetDataError(
          errorMessage: "Ha ocurrido un error. Intente guardar más tarde.",
        );
    } else if (event is RemoveDataEvent) {
      try {
        await _documentsList[event.index].reference.delete();
        _documentsList.removeAt(event.index);
        _hamburgersList.removeAt(event.index);
        yield CloudStoreRemoved();
      } catch (err) {
        yield CloudStoreGetDataError(
          errorMessage: "Ha ocurrido un error. Intente borrar mas tarde.",
        );
      }
    }
  }

  Future<bool> _getData() async {
    try {
      var hamburgers =
          await _firestoreInstance.collection("hamburguesas").getDocuments();
      _hamburgersList = hamburgers.documents
          .map(
            (hamburger) => ProductHamburguesas(
                productTitle: hamburger["productTitle"],
                productAmount: hamburger["productAmount"],
                productDescription: hamburger["productDescription"],
                productImage: hamburger["productImage"],
                available: hamburger["available"],
                productPrice: hamburger["productPrice"]),
          )
          .toList();
      _documentsList = hamburgers.documents;
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> _saveHamburger(
    String productTitle,
    String productDescription,
    String productImage,
    int productPrice,
    int productAmount,
    bool available
  ) async {
    try {
      await _firestoreInstance.collection("hamburguesas").document().setData({
        "productTitle": productTitle,
        "productDescription": productDescription,
        "productImage": productImage,
        "productPrice": productPrice,
        "productAmount": productAmount,
        "available": available
      });
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }
}
