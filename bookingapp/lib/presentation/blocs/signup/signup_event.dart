part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class FetchSignupEvent extends SignupEvent {
  final String customerName;
  final String phone;
  final String password;
  final String dob;
  FetchSignupEvent(
      {required this.customerName,
      required this.phone,
      required this.password,
      required this.dob});
}
