import 'package:bookingapp/api/request/base_request.dart';

class SignupRequest extends BaseRequest {
  final String phone;
  final String password;
  final String name;
  final String dob;
  SignupRequest({required this.phone,required this.password , required this.name , required this.dob});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "password":password,
      "customerName":name,
      "phone":phone,
      "dob":dob

    });
    return json;
  }
}