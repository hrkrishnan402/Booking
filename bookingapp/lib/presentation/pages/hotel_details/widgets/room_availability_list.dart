import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class RoomAvailabilityList extends StatefulWidget {
  final HotelDetailsResponse hotelDetailsResponse;
  const RoomAvailabilityList(
      {super.key,
      required this.hotelDetailsResponse});

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
      children: widget.hotelDetailsResponse.rooms!.map((room) => _buildRoomListTile(room)).toList(),
    );
  }

  Widget _buildRoomListTile(Rooms room) {
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
                      _buildHotelAmnieties(["Flat-screen TV", "Kitchenette", "Balcony"]),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildHotelIncludes(["Gym access", "Airport shuttle", "Late checkout"]),
                      _buildMaximumPerson(4)
                    ],
                  ),
                ),
                _buildBookingInfo(room)
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

  Widget _buildBookingInfo(Rooms room) {
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
        TextButton(
          onPressed: () {
           
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow[600],
          ),
          child: const Text("Book Now"),
        )
      ]),
    );
  }

  Widget _buildRoomPreviewImage(String url) {
    return SizedBox(width: 200, height: 120, child: Image.network(url));
  }
}
