import 'package:flutter/material.dart';
import 'package:tourista_ph/screens/home.dart';
import 'package:tourista_ph/screens/tourist_guide.dart';
import 'package:tourista_ph/screens/tourist_spot.dart';
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
      initialRoute: '/home',
      onGenerateRoute: (settings) {
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

        if (settings.name == TouristGuideScreen.routeName) {
          return MaterialPageRoute(builder: (context) => TouristGuideScreen());
        }

        if (settings.name == TravelItineraryScreen.routeName) {
          return MaterialPageRoute(
              builder: (context) => TravelItineraryScreen());
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
