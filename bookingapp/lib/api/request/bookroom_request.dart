import 'package:bookingapp/api/request/base_request.dart';

class BookroomRequest extends BaseRequest {
  final int roomId;
  final String date;
  BookroomRequest({required this.roomId,required this.date});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "roomId":roomId,
      "date":date,
    });
    return json;
  }
}