import 'package:bookingapp/api/request/base_request.dart';

class HotelDetailsRequest extends BaseRequest {
  final int hotelId;
  int? adults = 1;
  int? children = 0 ;
  String? fromDate;
  String? toDate;
  int? count = 1;
  HotelDetailsRequest({required this.hotelId,required this.adults,this.children, this.fromDate, this.toDate, this.count, });

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json.addAll({
      "hotelId":hotelId,
      "adults":adults??1,
      "children":children??0,
      "fromDate":fromDate??"",
      "toDate":toDate??"",
      "count":count??0
    });
    return json;
  }
}