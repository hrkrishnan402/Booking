import 'package:bookingapp/api/request/bookroom_request.dart';
import 'package:bookingapp/api/request/login_request.dart';
import 'package:bookingapp/api/request/signup_request.dart';
import 'package:bookingapp/api/response/booking_response.dart';
import 'package:bookingapp/api/response/login_response.dart';
import 'package:bookingapp/api/response/signup_response.dart';

abstract class IUserResourceService {
  Future<SignupResponse> signup(SignupRequest signupRequest);

  Future<LoginResponse> login(LoginRequest loginRequest);

   Future<BookRoomResponse> bookRoom(BookroomRequest bookroomRequest);
}
