import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourista_ph/screens/tourist_booking_details.dart';
import 'package:tourista_ph/screens/tourist_guide_booking_details.dart';
import 'package:tourista_ph/screens/tourist_order_details.dart';
import 'package:tourista_ph/screens/tourist_spot_booking_checkout.dart';
import 'package:tourista_ph/screens/tourist_spot_order_checkout.dart';

class TouristOrderBookingScreen extends StatefulWidget {
  static const routeName = '/touristorderbooking';
  @override
  _TouristOrderBookingScreenState createState() =>
      _TouristOrderBookingScreenState();
}

class _TouristOrderBookingScreenState extends State<TouristOrderBookingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
        body: Column(
          children: [
            Container(
              height: 40,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF569A87),
                labelColor: Color(0xFF569A87),
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  Tab(text: 'Menus'),
                  Tab(text: 'Rooms'),
                  Tab(text: 'Services'),
                  Tab(text: 'Souvenirs'),
                  Tab(text: 'Tourist Guides'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TouristOrderDetailsScreen.routeName);
                          },
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'M#21548625646',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Sta Cruz Island',
                            style: GoogleFonts.roboto(
                                fontSize: 12.0, fontStyle: FontStyle.italic),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TouristBookingDetailsScreen.routeName);
                          },
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'R#21548625646',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Sta Cruz Island',
                            style: GoogleFonts.roboto(
                                fontSize: 12.0, fontStyle: FontStyle.italic),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TouristBookingDetailsScreen.routeName);
                          },
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'S#21548625646',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Sta Cruz Island',
                            style: GoogleFonts.roboto(
                                fontSize: 12.0, fontStyle: FontStyle.italic),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Text('No Souvenirs Added.'),
                  )),
                  Container(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(context,
                                TouristGuideBookingDetailsScreen.routeName);
                          },
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'T#21548625646',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Travel Itinerary',
                            style: GoogleFonts.roboto(
                                fontSize: 12.0, fontStyle: FontStyle.italic),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
