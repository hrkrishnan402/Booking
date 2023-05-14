class LoginResponse {
  String? jwt;
  int? status;

  LoginResponse({this.jwt, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwt'] = jwt;
    data['status'] = status;
    return data;
  }
}