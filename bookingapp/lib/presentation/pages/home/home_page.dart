import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/pages/home/widgets/book_now_widget.dart';
import 'package:bookingapp/presentation/pages/home/widgets/hotel_booking_opennow_widget.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            
            children: const [
            HeaderWidget(),
            BookNowWidget(),
            HotelBookingOpenNowWidget()
          ]),
        ),
      ),
    );
  }
}
