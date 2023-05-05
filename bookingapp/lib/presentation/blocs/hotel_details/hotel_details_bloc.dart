import 'package:bloc/bloc.dart';
import 'package:bookingapp/api/api_exception.dart';
import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'hotel_details_event.dart';
part 'hotel_details_state.dart';

class HotelDetailsBloc extends Bloc<HotelDetailsEvent, HotelDetailsState> {
   final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  HotelDetailsBloc() : super(HotelDetailsInitial()) {
    on<HotelDetailsEvent>((event, emit) {
      
    });
    on<FetchHotelDetailsEvent>((event, emit) async {
       try {
          emit(HotelDetailsLoadingState());
          HotelDetailsResponse hotelDetailsResponse =
              await apiBridge.fetchHotelDetails(event.hotelId);
          emit(HotelDetailsSuccessState(hotelDetailsResponse: hotelDetailsResponse));
        } on ApiException catch (e) {
          emit(
              HotelDetailsFailedState(statusCode: e.code, message: e.toString()));
        }
    });
  }
}
