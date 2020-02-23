// import 'package:app_google/blocs/bloc_login/event_login.dart';
// import 'package:app_google/blocs/bloc_login/state_login.dart';
// import 'package:app_google/helper/validators.dart';
// import 'package:app_google/repos/repo_user.dart';
// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

import 'package:app_google/helper/validators.dart';
import 'package:app_google/repos/repo_user.dart';
import 'package:bloc/bloc.dart';

import 'event_login.dart';
import 'state_login.dart';

class BlocLogin extends Bloc<EventLogin, StateLogin> {
  RepoUser _repoUser;
  

  BlocLogin({@required RepoUser repoUser})
      : assert(repoUser != null),
        _repoUser = repoUser;
  @override
  StateLogin get initialState => StateLogin.empty();

  @override
  Stream<StateLogin> transformEvents(Stream<EventLogin> events,
      Stream<StateLogin> Function(EventLogin event) next) {
        
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<StateLogin> mapEventToState(EventLogin event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialPressed) {
      yield* _mapLoginWithCredentialPressToState(
          email: event.email, password: event.password);
    }
  }
}

Stream<StateLogin> _mapLoginWithCredentialPressToState(
    {String email, String password}) async* {
  yield StateLogin.loading();
  try {
    await _repoUser.signInWithCredentials(email, password);
    yield StateLogin.success();
  } catch (_) {
    yield StateLogin.failure();
  }
}

Stream<StateLogin> _mapPasswordChangedToState(String password) async* {
  yield state.update(isPasswordValid: Validators.isValidPassword(password));
}

Stream<StateLogin> _mapEmailChangedToState(String email) async* {
  yield state.update(isEmailValid: Validators.isValidEmail(email));
}
