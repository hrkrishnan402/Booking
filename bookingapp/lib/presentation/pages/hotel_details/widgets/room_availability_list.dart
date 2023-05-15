import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/book_room/book_room_bloc.dart';
import 'package:bookingapp/presentation/blocs/login/login_bloc.dart';
import 'package:bookingapp/presentation/pages/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RoomAvailabilityList extends StatefulWidget {
  final HotelDetailsResponse hotelDetailsResponse;
  const RoomAvailabilityList({super.key, required this.hotelDetailsResponse});

  @override
  State<RoomAvailabilityList> createState() => _RoomAvailabilityListState();
}

class _RoomAvailabilityListState extends State<RoomAvailabilityList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.hotelDetailsResponse.rooms!
          .map((room) => _buildRoomListTile(room))
          .toList(),
    );
  }

  Widget _buildRoomListTile(Rooms room) {
    BookRoomBloc bookRoomBloc = BookRoomBloc();
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {},
        child: Card(
            margin: const EdgeInsets.only(left: 0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(children: [
                _buildRoomPreviewImage(room.displayImages![0]),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          room.roomTitle.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildHotelAmnieties(
                          ["Flat-screen TV", "Kitchenette", "Balcony"]),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildHotelIncludes(
                          ["Gym access", "Airport shuttle", "Late checkout"]),
                      _buildMaximumPerson(4)
                    ],
                  ),
                ),
                _buildBookingInfo(room, bookRoomBloc)
              ]),
            )),
      ),
    );
  }

  Widget _buildHotelAmnieties(List<String> amnieteis) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: RichText(
          text: TextSpan(
              text: "Amnieties ",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.bold),
              children: amnieteis
                  .map((e) => TextSpan(
                        text: "$e  ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontWeight: FontWeight.normal),
                      ))
                  .toList())),
    );
  }

  Widget _buildMaximumPerson(int maximum) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: RichText(
          text: TextSpan(
              text: "Maxiimum ",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
            TextSpan(
              text: "$maximum  Persons",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.normal),
            )
          ])),
    );
  }

  Widget _buildHotelIncludes(List<String> amnieteis) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: RichText(
          text: TextSpan(
              text: "Includes ",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.bold),
              children: amnieteis
                  .map((e) => TextSpan(
                        text: e + " ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontWeight: FontWeight.normal),
                      ))
                  .toList())),
    );
  }

  Widget _buildBookingInfo(Rooms room, BookRoomBloc bookRoomBloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
          "Price Per night",
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            room.currentPrice.toString(),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold, color: Palette.secondary),
          ),
        ),
        BlocConsumer<BookRoomBloc, BookRoomState>(
          bloc: bookRoomBloc,
          listener: (context, state) {
            if (state is BookroomSuccessState) {
              //Do Something here
            } else if (state is BookroomFailedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                //check if auth bloc login success
                //if true call booking api
                //else open auth modal
                LoginState loginState =
                    BlocProvider.of<LoginBloc>(context).state;
                if (loginState is LoginSuccessState) {
                  //booking api call
                  final dateFormat = DateFormat('dd-MM-yyyy');
                  bookRoomBloc.add(FetchBookRoomEvent(
                      roomId: room.roomId as int,
                      date: dateFormat.format(DateTime.now())));
                } else {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: AuthPage()));
                      });
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow[600],
              ),
              child: const Text("Book Now"),
            );
          },
        )
      ]),
    );
  }

  Widget _buildRoomPreviewImage(String url) {
    return SizedBox(width: 200, height: 120, child: Image.network(url));
  }
}
