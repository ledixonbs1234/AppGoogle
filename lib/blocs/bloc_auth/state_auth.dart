part of 'bloc_auth.dart';
abstract class StateAuth extends Equatable  {
  const StateAuth();
  @override
  List<Object> get props => [];
}

class Uninitialized extends StateAuth {}

class Authenticated extends StateAuth {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated {displayName : $displayName}';
}

class UnAuthenticated extends StateAuth {}
