import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristSpotBookingCheckoutScreen extends StatefulWidget {
  static const routeName = '/touristspotbookingcheckout';
  @override
  _TouristSpotBookingCheckoutScreenState createState() =>
      _TouristSpotBookingCheckoutScreenState();
}

class _TouristSpotBookingCheckoutScreenState
    extends State<TouristSpotBookingCheckoutScreen> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  int numberOfDays = 1;

  Future<Null> _selectDate(BuildContext context, String fromTo) async {
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
      initialDate: fromDate,
      firstDate: fromDate,
      lastDate: DateTime(2101),
    );

    if (fromTo == 'from') {
      if (picked != null && picked != fromDate) {
        setState(() {
          fromDate = picked;
        });
      }
    } else if (fromTo == 'to') {
      if (picked != null && picked != toDate) {
        setState(() {
          toDate = picked;
          numberOfDays = toDate.difference(fromDate).inDays + 1;
        });
      }
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
              'Checkout - Bookings',
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Php 17,500.00',
                          style: GoogleFonts.roboto(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('From',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context, 'from');
                                },
                                child: Text(
                                  "${fromDate.toLocal()}".split(' ')[0],
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('To',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context, 'to');
                                },
                                child: Text(
                                  "${toDate.toLocal()}".split(' ')[0],
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. of Days',
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$numberOfDays',
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total',
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Php 17,500.00',
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
                    barrierDismissible: true,
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
                    Navigator.pop(context);
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
