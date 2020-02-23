part of 'bloc_auth.dart';


abstract class EventAuth extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends EventAuth {}

class LoginIn extends EventAuth {}

class LogedOut extends EventAuth {}
