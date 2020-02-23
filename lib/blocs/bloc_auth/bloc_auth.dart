import 'dart:async';
import 'package:app_google/repos/repo_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'state_auth.dart';
part 'event_auth.dart';


class BlocAuth extends Bloc<EventAuth, StateAuth> {
  final RepoUser _repoUser;

  BlocAuth({@required RepoUser repoUser})
      : assert(repoUser != null),
        _repoUser = repoUser;

  @override
  StateAuth get initialState => Uninitialized();

  @override
  Stream<StateAuth> mapEventToState(
    EventAuth event,
  ) async* {
    if (event is AppStated) {
      yield* _mapAppStartToState();
    } else if (event is LoginIn) {
      yield* _mapLoginInToState();
    } else if (event is LogedOut) {
      yield* _mapLogedOutToState();
    }
  }

  Stream<StateAuth> _mapAppStartToState() async*{
    try{
      final isSignIn = await _repoUser.isSignIn();
      if(isSignIn){
        final name = await _repoUser.getUser();
        yield Authenticated(name);
      }else {
        yield UnAuthenticated();
      }
    }catch(_){
      yield UnAuthenticated();
    }
  }
  Stream<StateAuth> _mapLoginInToState()async *{
    yield Authenticated(await _repoUser.getUser());
  }

  Stream<StateAuth> _mapLogedOutToState()async*{
    yield UnAuthenticated();
    _repoUser.signOut();
  }
}
