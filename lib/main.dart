import 'package:flutter/material.dart';
import 'package:tourista_ph/screens/home.dart';
import 'package:tourista_ph/screens/login.dart';
import 'package:tourista_ph/screens/tourist.dart';
import 'package:tourista_ph/screens/tourist_booking_details.dart';
import 'package:tourista_ph/screens/tourist_guide.dart';
import 'package:tourista_ph/screens/tourist_guide_booking_checkout.dart';
import 'package:tourista_ph/screens/tourist_guide_booking_details.dart';
import 'package:tourista_ph/screens/tourist_order_booking.dart';
import 'package:tourista_ph/screens/tourist_order_details.dart';
import 'package:tourista_ph/screens/tourist_spot.dart';
import 'package:tourista_ph/screens/tourist_spot_booking_checkout.dart';
import 'package:tourista_ph/screens/tourist_spot_order_checkout.dart';
import 'package:tourista_ph/screens/tourist_spot_order_booking.dart';
import 'package:tourista_ph/screens/travel_itinerary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourista PH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        if (settings.name == LoginScreen.routeName) {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        }

        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }

        if (settings.name == TouristSpotScreen.routeName) {
          return MaterialPageRoute(builder: (context) => TouristSpotScreen());
        }

        if (settings.name == TouristSpotOrderBookingScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristSpotOrderBookingScreen());
        }

        if (settings.name == TouristSpotOrderCheckoutScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristSpotOrderCheckoutScreen());
        }

        if (settings.name == TouristSpotBookingCheckoutScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristSpotBookingCheckoutScreen());
        }

        if (settings.name == TouristGuideScreen.routeName) {
          return MaterialPageRoute(builder: (context) => TouristGuideScreen());
        }

        if (settings.name == TouristGuideBookingCheckoutScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristGuideBookingCheckoutScreen());
        }

        if (settings.name == TouristGuideBookingDetailsScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristGuideBookingDetailsScreen());
        }

        if (settings.name == TravelItineraryScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TravelItineraryScreen());
        }

        if (settings.name == TouristOrderBookingScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristOrderBookingScreen());
        }

        if (settings.name == TouristOrderDetailsScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristOrderDetailsScreen());
        }

        if (settings.name == TouristBookingDetailsScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TouristBookingDetailsScreen());
        }

        if (settings.name == TouristScreen.routeName) {
          return MaterialPageRoute(builder: (context) => TouristScreen());
        }

        // if (settings.name == SectionScreen.routeName) {
        //   final SectionScreenArguments args = settings.arguments;

        //   return MaterialPageRoute(
        //     builder: (context) => SectionScreen(
        //       sectionId: args.sectionId,
        //       sectionName: args.sectionName,
        //     ),
        //   );
        // }

        return null;
      },
    );
  }
}
