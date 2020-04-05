import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snacks_event.dart';
part 'snacks_state.dart';

class SnacksBloc extends Bloc<SnacksEvent, SnacksState> {
  @override
  SnacksState get initialState => SnacksInitial();

  @override
  Stream<SnacksState> mapEventToState(
    SnacksEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
