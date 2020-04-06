part of 'hamburgers_bloc.dart';

abstract class HamburgersState extends Equatable {
  const HamburgersState();
}

class HamburgersInitial extends HamburgersState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetData extends HamburgersState {
  @override
  List<Object> get props => [];
}

class CloudStoreGetDataError extends HamburgersState {
  final String errorMessage;

  CloudStoreGetDataError({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class CloudStoreRemoved extends HamburgersState {
  @override
  List<Object> get props => [];
}

class CloudStoreSaved extends HamburgersState {
  @override
  List<Object> get props => [];
}
