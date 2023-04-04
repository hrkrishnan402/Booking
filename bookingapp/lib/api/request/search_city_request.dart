import 'package:bookingapp/api/request/base_request.dart';

class SearchCityRequest extends BaseRequest {
  final String keyword;
  SearchCityRequest({required this.keyword});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "keyword":keyword
    });
    return json;
  }
}
