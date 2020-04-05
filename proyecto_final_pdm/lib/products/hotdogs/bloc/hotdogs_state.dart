part of 'hotdogs_bloc.dart';

abstract class HotdogsState extends Equatable {
  const HotdogsState();
}

class HotdogsInitial extends HotdogsState {
  @override
  List<Object> get props => [];
}
