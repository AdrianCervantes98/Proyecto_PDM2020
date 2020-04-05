import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hotdogs_event.dart';
part 'hotdogs_state.dart';

class HotdogsBloc extends Bloc<HotdogsEvent, HotdogsState> {
  @override
  HotdogsState get initialState => HotdogsInitial();

  @override
  Stream<HotdogsState> mapEventToState(
    HotdogsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
