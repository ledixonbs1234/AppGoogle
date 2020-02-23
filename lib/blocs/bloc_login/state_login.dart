import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StateLogin {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  StateLogin(
      {@required this.isEmailValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure});

  factory StateLogin.empty() {
    return StateLogin(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: false,
        isSuccess: false);
  }

  factory StateLogin.loading() {
    return StateLogin(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: true,
        isSuccess: false);
  }
  factory StateLogin.failure() {
    return StateLogin(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: true,
        isSubmitting: false,
        isSuccess: false);
  }

  factory StateLogin.success() {
    return StateLogin(
        isEmailValid: true,
        isPasswordValid: true,
        isFailure: false,
        isSubmitting: false,
        isSuccess: true);
  }

  StateLogin update({bool isEmailValid, bool isPasswordValid}) {
    return copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isFailure: false,
        isSubmitting: false,
        isSuccess: false);
  }

  StateLogin copyWith(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitEnabled,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure}) {
    return StateLogin(
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess);
  }

  @override 
  String toString(){
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
