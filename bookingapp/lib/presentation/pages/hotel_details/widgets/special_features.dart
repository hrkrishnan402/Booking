import 'package:flutter/material.dart';

class SpecialFeatures extends StatelessWidget {
  const SpecialFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderSide borderSideTransparent = const BorderSide(
      color: Colors.transparent,
      width: 2.0,
      style: BorderStyle.solid,
    );
    return Table(
      border: TableBorder(
        top: borderSideTransparent,
        bottom: borderSideTransparent,
        left: borderSideTransparent,
        right: borderSideTransparent,
        horizontalInside: borderSideTransparent.copyWith(color: Colors.grey),
        verticalInside: borderSideTransparent,
      ),
      children: [
        TableRow(
          children: [
            _buildTableCell('Hotel Name'),
            _buildTableCell('Location'),
            _buildTableCell('Room Type'),
            _buildTableCell('Price', textAlign: TextAlign.end),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('The Ritz-Carlton'),
            _buildTableCell('New York, NY'),
            _buildTableCell('Deluxe Room'),
            _buildTableCell('\$500', textAlign: TextAlign.end),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Hotel Bel-Air'),
            _buildTableCell('Los Angeles, CA'),
            _buildTableCell('Suite'),
            _buildTableCell('\$1000', textAlign: TextAlign.end),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('The Plaza'),
            _buildTableCell('New York, NY'),
            _buildTableCell('Penthouse'),
            _buildTableCell('\$2000', textAlign: TextAlign.end),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Four Seasons'),
            _buildTableCell('Miami, FL'),
            _buildTableCell('Executive Suite'),
            _buildTableCell('\$700', textAlign: TextAlign.end),
          ],
        ),
      ],
    );
  }

  TableCell _buildTableCell(String value, {Icon? icon, TextAlign? textAlign}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: icon != null
            ? Row(
                children: [
                  icon,
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(value),
                ],
              )
            : Text(value, textAlign: textAlign ?? TextAlign.start),
      ),
    );
  }
}
