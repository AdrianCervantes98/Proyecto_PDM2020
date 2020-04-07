import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyecto_final_pdm/authentication/authentication_provider.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationProvider _authProv = AuthenticationProvider();
  AuthenticationProvider get getAuthProvider => _authProv;
  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is VerifyAuthenticatedUser) {
      try {
        if (await _authProv.userAlreadyLogged())
          yield AuthenticatedSuccessfully();
        else
          yield UnAuthenticated();
      } catch (err) {
        print(err.toString());
        yield AuthenticationError();
      }
    } else if (event is LogOut) {
      try {
        await _authProv.logOutGoogle();
        yield UnAuthenticated();
      } catch (err) {
        print(err.toString());
        yield AuthenticationError();
      }
    } else if (event is LoginWithGoogle) {
      try {
        await _authProv.signInWithGoogle();
        yield AuthenticatedSuccessfully();
      } catch (err) {
        print(err.toString());
        yield AuthenticationError();
      }
    } else if (event is LoginWithEmail) {
      try {
        yield AuthenticatedSuccessfully();
      } catch (err) {
        print(err.toString());
        yield AuthenticationError();
      }
    }
  }
}
