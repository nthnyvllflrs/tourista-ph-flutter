import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristGuideBookingCheckoutScreen extends StatefulWidget {
  static const routeName = '/touristguidebookingcheckoutscreen';
  @override
  _TouristGuideBookingCheckoutScreenState createState() =>
      _TouristGuideBookingCheckoutScreenState();
}

class _TouristGuideBookingCheckoutScreenState
    extends State<TouristGuideBookingCheckoutScreen> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF569A87),
            accentColor: const Color(0xFF569A87),
            colorScheme: ColorScheme.light(primary: const Color(0xFF569A87)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text(
              'T#21548625646',
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Travel Itinerary'),
                  Text(
                    'Travel Itinerary',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tourist Guide'),
                  Text(
                    'Tourist Guide',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('City'),
                  Text(
                    'Zamboanga City',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date'),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Php 5,000.00',
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: RawMaterialButton(
                fillColor: Color(0xFF569A87),
                splashColor: Color(0xFF165A5A),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Checkout",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Color(0xFF569A87)),
                            ),
                            SizedBox(width: 8.0),
                            Container(
                              margin: EdgeInsets.all(4.0),
                              child: Text(
                                "Processing. Please wait ...",
                                style: GoogleFonts.roboto(
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  Timer(Duration(seconds: 3), () {
                    Navigator.pop(context);
                    Navigator.pop(context, 'Booking Successfully Sent.');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
