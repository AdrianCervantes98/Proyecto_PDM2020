part of 'hotdogs_bloc.dart';

abstract class HotdogsEvent extends Equatable {
  const HotdogsEvent();
}

class GetDataEvent extends HotdogsEvent{
  @override
  List<Object> get props => [];
}
