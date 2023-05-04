import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class RoomAvailabilityList extends StatefulWidget {
  const RoomAvailabilityList({super.key, required this.initDataBloc});
  final Function initDataBloc;

  @override
  State<RoomAvailabilityList> createState() => _RoomAvailabilityListState();
}

class _RoomAvailabilityListState extends State<RoomAvailabilityList> {
  @override
  void initState() {
    super.initState();
    widget.initDataBloc();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hotelRooms = [
      {
        "url": "https://picsum.photos/id/1005/1280/792",
        "amenities": ["Free WiFi", "Air conditioning", "Mini fridge"],
        "includes": ["Breakfast", "Parking", "Pool access"],
        "maximum": 2,
        "name": "Cozy Double Room",
      },
      {
        "url": "https://picsum.photos/id/1011/1280/792",
        "amenities": ["Flat-screen TV", "Kitchenette", "Balcony"],
        "includes": ["Gym access", "Airport shuttle", "Late checkout"],
        "maximum": 4,
        "name": "Deluxe Family Suite",
      },
      {
        "url": "https://picsum.photos/id/1015/1280/792",
        "amenities": ["Private bathroom", "Safe", "Desk"],
        "includes": ["Room service", "Concierge", "Laundry"],
        "maximum": 3,
        "name": "Executive King Room",
      }
    ];

    return Column(
      children: hotelRooms.map((room) => _buildRoomListTile(room)).toList(),
    );
  }

  Widget _buildRoomListTile(room) {
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
                _buildRoomPreviewImage(room["url"]),
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
                          room['name'],
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildHotelAmnieties(room["amenities"]),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildHotelIncludes(room["includes"]),
                      _buildMaximumPerson(room['maximum'])
                    ],
                  ),
                ),
                _buildBookingInfo()
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

  Widget _buildBookingInfo() {
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
            "650",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold, color: Palette.secondary),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.initDataBloc();
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
