part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();
}

class PhotoInitial extends PhotoState {
  @override
  List<Object> get props => [];
}

class CloudStoreError extends PhotoState {
  final String errorMessage;

  CloudStoreError({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class CloudStoreRemoved extends PhotoState {
  @override
  List<Object> get props => [];
}

class CloudStoreSaved extends PhotoState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetData extends PhotoState {
  @override
  List<Object> get props => [];
}