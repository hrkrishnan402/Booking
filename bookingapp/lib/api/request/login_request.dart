import 'package:bookingapp/api/request/base_request.dart';

class LoginRequest extends BaseRequest {
  final String phone;
  final String password;
  LoginRequest({required this.phone,required this.password});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "password":password,
      "phone":phone,
    });
    return json;
  }
}