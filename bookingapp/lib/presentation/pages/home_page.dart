import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCityBloc>(context)
        .add(SearchCityKeywordEvent(keyword: ""));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Cities / Hotels'),
        actions: [
          _buildProfileIconButton(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: _buildSearchTextField(context),
        ),
      ),
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: _buildBody()),
    );
  }

  Container _buildProfileIconButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.person,
            size: 25,
            color: Colors.grey[600],
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<SearchCityBloc, SearchCityState>(
        builder: (context, state) {
          if (state is SearchCitySuccessState &&
              state.searchCityResponse.cities!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.searchCityResponse.cities!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: Text(
                      state.searchCityResponse.cities![index].displayName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            );
          } else if (state is SearchCitySuccessState &&
              state.searchCityResponse.cities!.isEmpty) {
            return const SizedBox(
              height: 300,
              child: Center(
                  child: Text(
                "No Cities Found",
                style: TextStyle(fontSize: 20),
              )),
            );
          } else if (state is SearchCityFailedState) {
            return const SizedBox(
              height: 300,
              child: Text(
                "Error",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else if (state is SearchCityLoadingState) {
            return const SizedBox(
                height: 300, child: Center(child: CircularProgressIndicator()));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Container _buildSearchTextField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<SearchCityBloc>(context)
              .add(SearchCityKeywordEvent(keyword: value));
        },
        decoration: InputDecoration(
          hintText: 'Search cities / hotels',
          prefixIcon: const Icon( 
            Icons.search,
            color: Colors.black,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
