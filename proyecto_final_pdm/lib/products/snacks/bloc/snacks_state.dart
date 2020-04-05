part of 'snacks_bloc.dart';

abstract class SnacksState extends Equatable {
  const SnacksState();
}

class SnacksInitial extends SnacksState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetData extends SnacksState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetDataError extends SnacksState {
  final String errorMessage;

  CloudStoreGetDataError({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
