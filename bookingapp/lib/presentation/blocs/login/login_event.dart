part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class FetchLoginEvent extends LoginEvent {
  final String phone;
  final String password;
  FetchLoginEvent({
    required this.phone,
    required this.password,
  });
}

class LogoutEvent extends LoginEvent {
  
}