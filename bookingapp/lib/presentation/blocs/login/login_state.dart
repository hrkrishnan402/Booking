part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState{
  final LoginResponse loginResponse;
  LoginSuccessState({required this.loginResponse});
}

class LoginLoadingState extends LoginState {}

class LoginFailedState extends LoginState {
  final int statusCode;
  final String message;
  LoginFailedState({required this.statusCode , required this.message});
}
