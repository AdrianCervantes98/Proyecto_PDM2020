part of 'add_photo_bloc.dart';

abstract class AddPhotoEvent extends Equatable {
  const AddPhotoEvent();
}
class InitEvent extends AddPhotoEvent {
  @override
  List<Object> get props => [];
}

class ChooseImageEvent extends AddPhotoEvent {
  @override
  List<Object> get props => [];
}

class UploadFileEvent extends AddPhotoEvent {
  final File image;
  UploadFileEvent({
    @required this.image,
  });
  
  @override
  List<Object> get props => [image];
}