part of 'snacks_bloc.dart';

abstract class SnacksEvent extends Equatable {
  const SnacksEvent();
}

class GetDataEvent extends SnacksEvent {
  @override
  List<Object> get props => [];
}
