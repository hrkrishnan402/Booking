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

  Widget _buildBody() {
    return Container();
  }

  Widget _buildSearchTextField(BuildContext context) {
    return BlocBuilder<SearchCityBloc, SearchCityState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Autocomplete(
            optionsViewBuilder: (BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    height: state is SearchCitySuccessState &&
                            state.searchCityResponse.cities!.isNotEmpty
                        ? state.searchCityResponse.cities!.length * 30
                        : 100,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: options.map((String option) {
                          return ListTile(
                            title: Text(option),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        }),
                      ).toList(),
                    ),
                  ),
                ),
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              } else {
                List<String> matches = <String>[];
                if ((state is SearchCitySuccessState &&
                    state.searchCityResponse.cities!.isNotEmpty)) {
                  for (var e in state.searchCityResponse.cities!) {
                    matches.add(e.displayName);
                  }
                } else if (state is SearchCitySuccessState &&
                    state.searchCityResponse.cities!.isEmpty) {
                  matches.add("No results found");
                }
                return matches;
              }
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onChanged: (value) {
                  BlocProvider.of<SearchCityBloc>(context)
                      .add(SearchCityKeywordEvent(keyword: value));
                },
                onFieldSubmitted: (String value) {
                  // onFieldSubmitted();
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
              );
            },
            onSelected: (String selection) {
              print('You just selected $selection');
            },
          ),
        );
      },
    );
  }
}
