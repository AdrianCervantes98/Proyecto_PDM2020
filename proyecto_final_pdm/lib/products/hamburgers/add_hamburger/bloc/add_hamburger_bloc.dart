import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
part 'add_hamburger_event.dart';
part 'add_hamburger_state.dart';

class AddHamburgerBloc extends Bloc<AddHamburgerEvent, AddHamburgerState> {
  File _chosenImage;
  String _url;
  @override
  AddHamburgerState get initialState => AddHamburgerInitial();

  @override
  Stream<AddHamburgerState> mapEventToState(
    AddHamburgerEvent event,
  ) async* {
    if (event is ChooseImageEvent) {
      bool imagePicked = await _chooseImage();
      if (imagePicked) {
        yield GetImageState(image: _chosenImage);
      } else {
        yield GetImageErrorState(
            errorMessage: "No se pudo seleccionar la imagen.");
      }
    } else if (event is UploadFileEvent) {
      bool fileUploaded = await _uploadFile();
      if (fileUploaded) {
        yield UploadedFileState(image: _url);
      } else {
        yield UploadedFileErrorState(errorMessage: "No se pudo cargar la imagen.");
      }
    } else if (event is InitEvent) {
      yield AddHamburgerInitial();
    }
  }

  Future<bool> _chooseImage() async {
    try {
      await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 720,
        maxWidth: 720,
      ).then((image) {
        _chosenImage = image;
      });
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  Future<bool> _uploadFile() async {
    try {
      String filePath = _chosenImage.path;
      StorageReference reference = FirebaseStorage.instance
          .ref()
          .child("hamburguesas/${Path.basename(filePath)}");
      StorageUploadTask uploadTask = reference.putFile(_chosenImage);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      taskSnapshot.ref.getDownloadURL().then((imageUrl) {
        print("Link>>>>> $imageUrl");
      });

      await reference.getDownloadURL().then((fileURL) {
        print("$fileURL");
        _url = fileURL;
      });
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }
}
