part of 'add_hamburger_bloc.dart';

abstract class AddHamburgerState extends Equatable {
  const AddHamburgerState();
}

class AddHamburgerInitial extends AddHamburgerState {
  @override
  List<Object> get props => [];
}

class GetImageState extends AddHamburgerState {
  final File image;

  GetImageState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class GetImageErrorState extends AddHamburgerState {
  final String errorMessage;

  GetImageErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}

class UploadedFileState extends AddHamburgerState {
  final dynamic image;

  UploadedFileState({
    @required this.image
  });
  @override
  List<Object> get props => [image];
}

class UploadedFileErrorState extends AddHamburgerState {
  final String errorMessage;

  UploadedFileErrorState({
    @required this.errorMessage
  });
  @override
  List<Object> get props => [errorMessage];
}
