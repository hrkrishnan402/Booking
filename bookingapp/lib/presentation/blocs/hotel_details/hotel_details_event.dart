part of 'hotel_details_bloc.dart';

@immutable
abstract class HotelDetailsEvent {}

// ignore: must_be_immutable
class FetchHotelDetailsEvent extends HotelDetailsEvent {
   final int hotelId;
  int? adults = 1;
  int? children = 0 ;
  String? fromDate;
  String? toDate;
  int? count = 1;
  FetchHotelDetailsEvent({
    required this.hotelId , this.adults,this.children , this.fromDate,this.count,this.toDate
  });
}