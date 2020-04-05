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
}
