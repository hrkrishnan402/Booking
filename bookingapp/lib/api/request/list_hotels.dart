import 'package:bookingapp/api/request/base_request.dart';

class ListHotelRequest extends BaseRequest {
  final String keyword;
  ListHotelRequest({required this.keyword});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "keyword":keyword
    });
    return json;
  }
}