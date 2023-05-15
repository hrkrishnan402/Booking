import 'package:bloc/bloc.dart';
import 'package:bookingapp/api/response/booking_response.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'book_room_event.dart';
part 'book_room_state.dart';

class BookRoomBloc extends Bloc<BookRoomEvent, BookRoomState> {
  final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  BookRoomBloc() : super(BookRoomInitial()) {
    on<BookRoomEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchBookRoomEvent>((event, emit) async {
      emit(BookroomLoadingState());
      BookRoomResponse bookRoomResponse =
          await apiBridge.bookRoom(event.roomId, event.date);
      emit(BookroomSuccessState(bookRoomResponse: bookRoomResponse));
    });
  }
}
