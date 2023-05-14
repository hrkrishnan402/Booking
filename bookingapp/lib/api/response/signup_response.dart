class SignupResponse {
  int? customerId;
  String? customerName;
  String? phone;
  String? dob;
  String? created;
  Null? updated;
  String? role;

  SignupResponse(
      {this.customerId,
      this.customerName,
      this.phone,
      this.dob,
      this.created,
      this.updated,
      this.role});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    phone = json['phone'];
    dob = json['dob'];
    created = json['created'];
    updated = json['updated'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['phone'] = phone;
    data['dob'] = dob;
    data['created'] = created;
    data['updated'] = updated;
    data['role'] = role;
    return data;
  }
}