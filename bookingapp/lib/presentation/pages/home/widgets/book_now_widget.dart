import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class BookNowWidget extends StatelessWidget {
  const BookNowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: Palette.teritiary,
        padding: EdgeInsets.symmetric(
            vertical: 160, horizontal: MediaQuery.of(context).size.width / 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildIntroductionText(context),
          const SizedBox(
            width: 20.0,
          ),
          _buildBookingForm()
        ]),
      ),
    );
  }

  Flexible _buildBookingForm() {
    return Flexible(
      flex: 2,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
          child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(child: _buildFormTextField("Enter your name")),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Flexible(child: _buildFormTextField("Enter your phone")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(child: _buildFormTextField("Enter your email")),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Flexible(
                  child: _buildFormTextField("City Destination , Hotel Name")),
              const SizedBox(
                height: 10.0,
              ),
              //show date picker here
              Row(
                children: [
                  Flexible(child: _buildFormTextField("Check In")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(child: _buildFormTextField("Check out")),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildFormDropdown("No of rooms", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: _buildFormDropdown("Room type", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildFormDropdown("No of adults", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child:
                        _buildFormDropdown("No of children", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildFormDropdown("Min Price", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: _buildFormDropdown("Max Price", (String? newValue) {
                      // Do something when the dropdown value changes
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                  child: ElevatedButton(
                    
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Palette.buttonBackground),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 26.0), // set the horizontal padding
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("BOOK NOW")))
            ],
          )),
        ),
      ),
    );
  }

  Container _buildFormDropdown(
      String hintText, Function(String? newValue) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        hint: Text(hintText),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        underline: Container(
          height: 0,
        ),
        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  TextField _buildFormTextField(String hintText,
      {TextEditingController? textEditingController}) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Flexible _buildIntroductionText(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "INDIA LEADING TOURS AND TRAVEL'S",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Palette.onTeritiary),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "HOTEL BOOKING NOW",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Palette.onTeritiary),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Experience the various tours and travel packages and Make Hotel Reservation,\nfind vacation packages , search cheap hotels and events",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Palette.onTeritiary,
                      height: 2,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIcon(Icons.apartment),
              const SizedBox(
                width: 25.0,
              ),
              _buildIcon(Icons.home),
              const SizedBox(
                width: 25.0,
              ),
              _buildIcon(Icons.apartment),
            ],
          )
        ],
      ),
    );
  }

  Container _buildIcon(IconData icon) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Palette.onTeritiary)),
      child: Icon(
        icon,
        color: Palette.onTeritiary,
        size: 150,
      ));
}
