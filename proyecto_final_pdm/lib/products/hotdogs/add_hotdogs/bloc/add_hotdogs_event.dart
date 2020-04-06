part of 'add_hotdogs_bloc.dart';

abstract class AddHotdogsEvent extends Equatable {
  const AddHotdogsEvent();
}

class InitEvent extends AddHotdogsEvent {
  @override
  List<Object> get props => [];
}

class ChooseImageEvent extends AddHotdogsEvent {
  @override
  List<Object> get props => [];
}

class UploadFileEvent extends AddHotdogsEvent {
  final File image;
  UploadFileEvent({
    @required this.image,
  });
  
  @override
  List<Object> get props => [image];
}