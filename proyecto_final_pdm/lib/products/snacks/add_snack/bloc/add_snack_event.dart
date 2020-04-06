part of 'add_snack_bloc.dart';

abstract class AddSnackEvent extends Equatable {
  const AddSnackEvent();
}

class InitEvent extends AddSnackEvent {
  @override
  List<Object> get props => [];
}

class ChooseImageEvent extends AddSnackEvent {
  @override
  List<Object> get props => [];
}

class UploadFileEvent extends AddSnackEvent {
  final File image;
  UploadFileEvent({
    @required this.image,
  });
  
  @override
  List<Object> get props => [image];
}