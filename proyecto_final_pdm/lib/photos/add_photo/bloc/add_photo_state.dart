part of 'add_photo_bloc.dart';

abstract class AddPhotoState extends Equatable {
  const AddPhotoState();
}

class AddPhotoInitial extends AddPhotoState {
  @override
  List<Object> get props => [];
}
class GetImageState extends AddPhotoState {
  final File image;

  GetImageState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class GetImageErrorState extends AddPhotoState {
  final String errorMessage;

  GetImageErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}

class UploadedFileState extends AddPhotoState {
  final dynamic image;

  UploadedFileState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class UploadedFileErrorState extends AddPhotoState {
  final String errorMessage;

  UploadedFileErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}