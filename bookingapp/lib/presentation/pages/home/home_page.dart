import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/presentation/pages/hotel_list/hotel_list.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/listhotels_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCityBloc>(context)
        .add(SearchCityKeywordEvent(keyword: ""));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(),
          BlocBuilder<ListhotelsBloc, ListhotelsState>(
            builder: (context, state) {
              return HotelListWidget(
                initDataBloc: () {
                  BlocProvider.of<ListhotelsBloc>(context)
                      .add(GetHotelListEvent(keyword: "4"));
                },
              );
            },
          )
          // BookNowWidget(),
          // HotelBookingOpenNowWidget()
        ]),
      ),
    );
  }
}
