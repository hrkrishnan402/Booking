import 'package:bloc/bloc.dart';
import 'package:bookingapp/api/response/signup_response.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchSignupEvent>((event, emit) {});
  }
}
