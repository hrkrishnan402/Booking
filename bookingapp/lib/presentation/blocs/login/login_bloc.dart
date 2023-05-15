import 'package:bookingapp/api/response/login_response.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends HydratedBloc<LoginEvent, LoginState> {
  final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      LoginResponse loginResponse =
          await apiBridge.login(event.phone, event.password);
      emit(LoginSuccessState(loginResponse: loginResponse));
    });
    on<LogoutEvent>((event, emit) async {
      emit(LoginInitial());
    });
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    if (json['jwt'] != null) {
      return LoginSuccessState(loginResponse: LoginResponse.fromJson(json));
    }
    return LoginInitial();
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    if (state is LoginSuccessState) {
      return state.loginResponse.toJson();
    }
    return {};
  }
}
