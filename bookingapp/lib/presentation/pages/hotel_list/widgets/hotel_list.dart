import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/bloc/listhotels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelListWidget extends StatefulWidget {
  const HotelListWidget({super.key, required this.initDataBloc});
  final Function initDataBloc;

  @override
  State<HotelListWidget> createState() => _HotelListWidgetState();
}

class _HotelListWidgetState extends State<HotelListWidget> {
  @override
  void initState() {
    super.initState();
    widget.initDataBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListhotelsBloc, ListhotelsState>(
      builder: (context, state) {
        if (state is ListHotelsSuccessState &&
            state.listHotelsResponse.hotels!.isNotEmpty) {
          return Column(
            children: state.listHotelsResponse.hotels!
                .map((hotel) => _buildHotelListTile(
                    hotel.hotelName, hotel.currentPrice, hotel.availableRooms))
                .toList(),
          );
        } else if (state is ListHotelsSuccessState &&
            state.listHotelsResponse.hotels!.isEmpty) {
          return const SizedBox(
            height: 400,
            child: Center(child: Text("No Hotels Found")),
          );
        }
        return const SizedBox(
          height: 300,
          child: Center(child: CircularProgressIndicator()),
        );
      },
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
                child: Row(
                  children: [
              _buildHotelPreviewImage(availableRooms),
              _buildHotelAddress(hotelName),
              _buildBookingInfo(),
            ])),
          )),
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

  Widget _buildHotelAddress(String hotelName) {
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
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
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

  Stack _buildHotelPreviewImage(int availableRooms) {
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

  Widget locationAndPhoneIcons(
    IconData icon,
    String addressOrPhone,
  ) =>
      Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          Text(
            addressOrPhone,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      );
}
