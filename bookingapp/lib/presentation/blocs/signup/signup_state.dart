part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSuccessState extends SignupState{
  final SignupResponse signupResponse;
  SignupSuccessState({required this.signupResponse});
}

class SignupLoadingState extends SignupState {}

class SignupFailedState extends SignupState {
  final int statusCode;
  final String message;
  SignupFailedState({required this.statusCode , required this.message});
}
