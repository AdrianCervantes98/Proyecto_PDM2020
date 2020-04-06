import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pdm/models/product_snacks.dart';

part 'snacks_event.dart';
part 'snacks_state.dart';

class SnacksBloc extends Bloc<SnacksEvent, SnacksState> {
  final Firestore _firestoreInstance = Firestore.instance;
  List<ProductSnacks> _snackList;
  List<DocumentSnapshot> _documentsList;
  List<ProductSnacks> get getSnacksList => _snackList;
  
  @override
  SnacksState get initialState => SnacksInitial();

  @override
  Stream<SnacksState> mapEventToState(
    SnacksEvent event,
  ) async* {
if(event is GetDataEvent) {
      bool dataRetrieved = await _getData();
      if(dataRetrieved) {
        yield CloudStoreGetData();
      } else {
        yield CloudStoreGetDataError(errorMessage: "No se pudo obtener la lista de productos.");
      }
    } else if (event is SaveDataEvent) {
      bool saved = await _saveSnack(
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
        _snackList.removeAt(event.index);
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
      var snacks =
          await _firestoreInstance.collection("snacks").getDocuments();
      _snackList = snacks.documents
          .map(
            (snack) => ProductSnacks(
              productTitle: snack["productTitle"],
              productAmount: snack["productAmount"],
              productDescription: snack["productDescription"],
              productImage: snack["productImage"],
              available: snack["available"],
              productPrice: snack["productPrice"]
            ),
          )
          .toList();
      _documentsList = snacks.documents;
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> _saveSnack(
    String productTitle,
    String productDescription,
    String productImage,
    int productPrice,
    int productAmount,
    bool available
  ) async {
    try {
      await _firestoreInstance.collection("snacks").document().setData({
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
