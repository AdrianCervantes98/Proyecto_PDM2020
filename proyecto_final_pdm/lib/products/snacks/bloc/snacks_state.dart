part of 'snacks_bloc.dart';

abstract class SnacksState extends Equatable {
  const SnacksState();
}

class SnacksInitial extends SnacksState {
  @override
  List<Object> get props => [];
}
