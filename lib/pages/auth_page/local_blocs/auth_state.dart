part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class TryingToLogIn extends AuthState {}

class LoginCompleted extends AuthState {}

class RequestError extends AuthState {

  final error;
  RequestError({this.error});

}

class ValidationError extends AuthState {}