import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../api/response/export.dart';

class HotelListWidget extends StatefulWidget {
  const HotelListWidget({super.key, required this.initDataBloc});
  final Function initDataBloc;

  @override
  State<HotelListWidget> createState() => _HotelListWidgetState();
}

class _HotelListWidgetState extends State<HotelListWidget> {
  Hotel? hotel = Hotel(hotelist: []);
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://bookingappcore-env.eba-xmeutmkw.ap-south-1.elasticbeanstalk.com/hotels?city=207&page=0&required_rooms=0");

    setState(() {
      hotel = Hotel.fromJson(response.data);
    });
    print(hotel?.hotelist);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: (hotel?.hotelist ?? []).isEmpty
          ? [const Center(child: Text("Fetching"))]
          : hotel!.hotelist
              .map((e) => _buildHotelListTile(
                  e.hotelName, e.currentPrice, e.availableRooms))
              .toList(),
    );
  }

  Widget _buildHotelListTile(
      String hotelName, int currentPrice, int availableRooms) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: ((context, index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                child: Row(children: [
              hotelPreviewImage(availableRooms),
              hotelAddress(hotelName),
              bookingInfo(),
            ])),
          )),
    );
  }

  Widget bookingInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
          "Price Per night",
          style: TextStyle(color: Colors.grey),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text("650"),
        ),
        TextButton(
          onPressed: () {
            widget.initDataBloc();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.yellow[600],
          ),
          child: const Text("Book Now"),
        )
      ]),
    );
  }

  Widget hotelAddress(String hotelName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                      child: Text(
                    hotelName,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: locationAndPhoneIcons(Icons.location_on_rounded,
                      "CM4G+GWG, Lake Rd, Kasturibai Colony, West Mere, Ooty, Tamil Nadu 643004"),
                ),
                locationAndPhoneIcons(Icons.call, "+098989 97799"),
              ],
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Stack hotelPreviewImage(int availableRooms) {
    return Stack(
      children: [
        Positioned(
          bottom: 5,
          left: 5,
          child: Container(
            color: Colors.green[200],
            width: 150,
            height: 20,
            child: Text("Available rooms: $availableRooms",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        Container(
            width: 200,
            height: 120,
            child: Image.network(
                "https://c4.wallpaperflare.com/wallpaper/921/708/937/best-hotels-travel-thailand-tourism-wallpaper-preview.jpg")),
      ],
    );
  }

  Widget locationAndPhoneIcons(IconData icon, String addressOrPhone) => Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          Text(addressOrPhone)
        ],
      );
}
