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
    if(event is GetDataEvent) {
      bool dataRetrieved = await _getData();
      if(dataRetrieved) {
        yield CloudStoreGetData();
      } else {
        yield CloudStoreGetDataError(errorMessage: "No se pudo obtener la lista de productos.");
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
              productPrice: hamburger["productPrice"]
            ),
          )
          .toList();
      _documentsList = hamburgers.documents;
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

}
