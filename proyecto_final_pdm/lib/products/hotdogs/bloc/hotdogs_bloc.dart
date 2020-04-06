import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pdm/models/product_hotdog.dart';

part 'hotdogs_event.dart';
part 'hotdogs_state.dart';

class HotdogsBloc extends Bloc<HotdogsEvent, HotdogsState> {
  final Firestore _firestoreInstance = Firestore.instance;
  List<ProductHotdog> _hotdogList;
  List<DocumentSnapshot> _documentsList;
  List<ProductHotdog> get getHotdogsList => _hotdogList;

  @override
  HotdogsState get initialState => HotdogsInitial();

  @override
  Stream<HotdogsState> mapEventToState(
    HotdogsEvent event,
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
      bool saved = await _saveHotdog(
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
        _hotdogList.removeAt(event.index);
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
      var hotdogs =
          await _firestoreInstance.collection("hotdogs").getDocuments();
      _hotdogList = hotdogs.documents
          .map(
            (hotdog) => ProductHotdog(
                productTitle: hotdog["productTitle"],
                productAmount: hotdog["productAmount"],
                productDescription: hotdog["productDescription"],
                productImage: hotdog["productImage"],
                available: hotdog["available"],
                productPrice: hotdog["productPrice"]),
          )
          .toList();
      _documentsList = hotdogs.documents;
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> _saveHotdog(
    String productTitle,
    String productDescription,
    String productImage,
    int productPrice,
    int productAmount,
    bool available
  ) async {
    try {
      await _firestoreInstance.collection("hotdogs").document().setData({
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
