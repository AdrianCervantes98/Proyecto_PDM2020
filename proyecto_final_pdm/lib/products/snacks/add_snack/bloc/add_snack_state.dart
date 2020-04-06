part of 'add_snack_bloc.dart';

abstract class AddSnackState extends Equatable {
  const AddSnackState();
}

class AddSnackInitial extends AddSnackState {
  @override
  List<Object> get props => [];
}

class GetImageState extends AddSnackState {
  final File image;

  GetImageState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class GetImageErrorState extends AddSnackState {
  final String errorMessage;

  GetImageErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}

class UploadedFileState extends AddSnackState {
  final dynamic image;

  UploadedFileState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class UploadedFileErrorState extends AddSnackState {
  final String errorMessage;

  UploadedFileErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}