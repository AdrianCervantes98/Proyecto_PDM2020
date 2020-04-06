part of 'hotdogs_bloc.dart';

abstract class HotdogsState extends Equatable {
  const HotdogsState();
}

class HotdogsInitial extends HotdogsState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetData extends HotdogsState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetDataError extends HotdogsState {
  final String errorMessage;

  CloudStoreGetDataError({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class CloudStoreRemoved extends HotdogsState {
  @override
  List<Object> get props => [];
}

class CloudStoreSaved extends HotdogsState {
  @override
  List<Object> get props => [];
}

