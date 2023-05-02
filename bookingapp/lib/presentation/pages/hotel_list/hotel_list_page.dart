import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/presentation/pages/hotel_list/widgets/hotel_list.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc/listhotels_bloc.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCityBloc>(context)
        .add(SearchCityKeywordEvent(keyword: ""));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(),
          Stack(
            children: [
              Container(
                height: 300,
                color:Palette.teritiary,
              ),
              Container(
                margin:  const EdgeInsets.symmetric(vertical: 30.0,horizontal: 120),
                color: Palette.onPrimary,
                child: BlocBuilder<ListhotelsBloc, ListhotelsState>(
                  builder: (context, state) {
                    return HotelListWidget(
                      initDataBloc: () {
                        BlocProvider.of<ListhotelsBloc>(context)
                            .add(GetHotelListEvent(keyword: "207"));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
