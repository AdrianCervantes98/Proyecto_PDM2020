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

}
