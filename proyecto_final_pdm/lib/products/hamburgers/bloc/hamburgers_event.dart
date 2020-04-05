part of 'hamburgers_bloc.dart';

abstract class HamburgersEvent extends Equatable {
  const HamburgersEvent();
}

class GetDataEvent extends HamburgersEvent {
  @override
  List<Object> get props => [];
}
