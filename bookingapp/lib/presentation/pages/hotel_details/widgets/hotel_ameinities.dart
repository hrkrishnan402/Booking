import 'package:flutter/material.dart';

class HotelAmeinities extends StatelessWidget {
  const HotelAmeinities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderSide borderSideTransparent = const BorderSide(
      color: Colors.transparent,
      width: 2.0,
      style: BorderStyle.solid,
    );
    return  Table(
      border: TableBorder(
        top: borderSideTransparent,
        bottom: borderSideTransparent,
        left: borderSideTransparent,
        right: borderSideTransparent,
        horizontalInside: borderSideTransparent,
        verticalInside: borderSideTransparent,
      ),
      children: [
        TableRow(
          children: [
            _buildTableCell(
              'Free Wi-Fi',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Swimming pool',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Gym',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell(
              '24-hour room service',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Laundry service',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Airport shuttle',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell(
              'Free parking',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Business center',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Spa',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell(
              'Concierge',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Restaurant',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Bar/Lounge',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell(
              'Pet friendly',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Meeting rooms',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
            _buildTableCell(
              'Gift shop',
              icon: const Icon(Icons.check_circle, color: Colors.yellow),
            ),
          ],
        ),
      ],
    );
  }

  TableCell _buildTableCell(String value, {Icon? icon, TextAlign? textAlign}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 0.0),
        child: icon != null
            ? Row(
                children: [
                  icon,
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(value),
                ],
              )
            : Text(value, textAlign: textAlign ?? TextAlign.start),
      ),
    );
  }
}
