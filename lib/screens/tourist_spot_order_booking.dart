import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourista_ph/screens/tourist_spot_booking_checkout.dart';
import 'package:tourista_ph/screens/tourist_spot_order_checkout.dart';

class TouristSpotOrderBookingScreen extends StatefulWidget {
  static const routeName = '/touristspotorderbooking';
  @override
  _TouristSpotOrderBookingScreenState createState() =>
      _TouristSpotOrderBookingScreenState();
}

class _TouristSpotOrderBookingScreenState
    extends State<TouristSpotOrderBookingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
                tabs: [
                  Tab(text: 'Menus'),
                  Tab(text: 'Rooms'),
                  Tab(text: 'Services'),
                  Tab(text: 'Souvenirs'),
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
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Item 1 (Php 500.00 x 5)',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.',
                            style: GoogleFonts.roboto(
                                fontSize: 11.0, fontStyle: FontStyle.italic),
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
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Item 1 (Php 500.00 x 5)',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.',
                            style: GoogleFonts.roboto(
                                fontSize: 11.0, fontStyle: FontStyle.italic),
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
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          trailing: Text(
                            'Php 2,500.00',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Item 1 (Php 500.00 x 5)',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.',
                            style: GoogleFonts.roboto(
                                fontSize: 11.0, fontStyle: FontStyle.italic),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Text('No Souvenirs Added.'),
                  )),
                ],
              ),
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
                  Text('Php 37,500.00',
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
                    "Proceed Checkout",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_tabController.index == 0 || _tabController.index == 3) {
                    Navigator.pushNamed(
                        context, TouristSpotOrderCheckoutScreen.routeName);
                  } else {
                    Navigator.pushNamed(
                        context, TouristSpotBookingCheckoutScreen.routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
