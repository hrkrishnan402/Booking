import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api/api_exception.dart';
import '../../../api/response/hoetl_list.response.dart';
import '../../../core/api_bridge.dart';

part 'listhotels_event.dart';
part 'listhotels_state.dart';

class ListhotelsBloc extends Bloc<GetHotelListEvent, ListhotelsState> {
  final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  ListhotelsBloc() : super(ListhotelsInitial()) {
    on<GetHotelListEvent>(
      (event, emit) async {
        try {
          emit(ListHotelsLoadingState());
          HotelListResponse searchCityResponse =
              await apiBridge.fetchHotelList(event.keyword);
          emit(ListHotelsSuccessState(listHotelsResponse: searchCityResponse));
        } on ApiException catch (e) {
          emit(
              ListHotelsFailedState(statusCode: e.code, message: e.toString()));
        }
      },
    );
  }
}
