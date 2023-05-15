import 'dart:convert';

import 'package:bookingapp/api/api_client.dart';
import 'package:bookingapp/api/api_config.dart';
import 'package:bookingapp/api/api_exception.dart';
import 'package:bookingapp/api/request/bookroom_request.dart';
import 'package:bookingapp/api/request/login_request.dart';
import 'package:bookingapp/api/request/signup_request.dart';
import 'package:bookingapp/api/response/booking_response.dart';
import 'package:bookingapp/api/response/login_response.dart';
import 'package:bookingapp/api/response/signup_response.dart';
import 'package:bookingapp/api/services/interface/iuser_resource_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class UserResourceService extends IUserResourceService {
  ApiClient apiClient = ApiClient();
  final _log = Logger();
  UserResourceService();

  @override
  Future<SignupResponse> signup(SignupRequest signupRequest) async {
    final path = "${ApiConfig.appApiUrl}auth/signup";
    Response response = await apiClient.invokeAPI(path, 'POST',
        body: signupRequest,
        headerParams: {"Content-Type": "application/json"});
    _log.i("$path\n${signupRequest.toJson()}\n${response.body}");
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      return SignupResponse.fromJson(responseMap);
    } else {
      throw ApiException(response.statusCode, "");
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final path = "${ApiConfig.appApiUrl}auth/login";
    Response response = await apiClient.invokeAPI(path, 'POST',
        body: loginRequest, headerParams: {"Content-Type": "application/json"});
    _log.i("$path\n${loginRequest.toJson()}\n${response.body}");
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(responseMap);
    } else {
      throw ApiException(response.statusCode, "");
    }
  }

  @override
  Future<BookRoomResponse> bookRoom(BookroomRequest bookroomRequest) async {
    final path = "${ApiConfig.appApiUrl}checkout/initiate";
    Response response = await apiClient.invokeAPI(path, 'POST',
        body: bookroomRequest,
        headerParams: {"Content-Type": "application/json"});
    _log.i("$path\n${bookroomRequest.toJson()}\n${response.body}");
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      return BookRoomResponse.fromJson(responseMap);
    } else {
      throw ApiException(response.statusCode, "");
    }
  }
}
