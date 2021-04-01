import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristSpotOrderBookingScreen extends StatefulWidget {
  static const routeName = '/touristspotorderbooking';
  @override
  _TouristSpotOrderBookingScreenState createState() =>
      _TouristSpotOrderBookingScreenState();
}

class _TouristSpotOrderBookingScreenState
    extends State<TouristSpotOrderBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text(
              'Bookings & Orders',
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
