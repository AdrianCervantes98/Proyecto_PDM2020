part of 'add_hotdogs_bloc.dart';

abstract class AddHotdogsState extends Equatable {
  const AddHotdogsState();
}

class AddHotdogsInitial extends AddHotdogsState {
  @override
  List<Object> get props => [];
}

class GetImageState extends AddHotdogsState {
  final File image;

  GetImageState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class GetImageErrorState extends AddHotdogsState {
  final String errorMessage;

  GetImageErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}

class UploadedFileState extends AddHotdogsState {
  final dynamic image;

  UploadedFileState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class UploadedFileErrorState extends AddHotdogsState {
  final String errorMessage;

  UploadedFileErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}