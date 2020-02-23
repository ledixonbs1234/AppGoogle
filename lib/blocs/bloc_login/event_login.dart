import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class EventLogin extends Equatable {
  const EventLogin();

  @override
  List<Object> get props => [];
}

class EmailChanged extends EventLogin {
  final String email;
  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email :$email}';
}

class PasswordChanged extends EventLogin {
  final String password;
  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'Password Changed {password:$password}';
}

class Submitted extends EventLogin {
  final String email;
  final String password;

  const Submitted({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Submitted {email :$email , password : $password}';
  }
}
class LoginWithCredentialPressed extends EventLogin {
  final String email;
  final String password;

  const LoginWithCredentialPressed({@required this.email,@required this.password});

  @override 
  List<Object> get props => [email,password];

  @override 
  String toString(){
    return 'LoginWithCredentialPressed {email :$email , password : $password}';
  }
}