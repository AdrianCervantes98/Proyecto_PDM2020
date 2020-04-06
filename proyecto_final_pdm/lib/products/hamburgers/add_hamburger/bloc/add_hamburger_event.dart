part of 'add_hamburger_bloc.dart';

abstract class AddHamburgerEvent extends Equatable {
  const AddHamburgerEvent();
}

class InitEvent extends AddHamburgerEvent {
  @override
  List<Object> get props => [];
}

class ChooseImageEvent extends AddHamburgerEvent {
  @override
  List<Object> get props => [];
}

class UploadFileEvent extends AddHamburgerEvent {
  final File image;
  UploadFileEvent({
    @required this.image,
  });
  
  @override
  List<Object> get props => [image];
}