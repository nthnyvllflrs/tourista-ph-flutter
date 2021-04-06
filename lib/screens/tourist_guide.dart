import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourista_ph/screens/tourist_guide_booking_checkout.dart';
import 'package:tourista_ph/screens/travel_itinerary.dart';

class TouristGuideScreen extends StatefulWidget {
  static const routeName = '/touristguide';
  @override
  _TouristGuideScreenState createState() => _TouristGuideScreenState();
}

class _TouristGuideScreenState extends State<TouristGuideScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        body: Column(
          children: [
            header(context),
            SizedBox(height: 8.0),
            Container(
              height: 30,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF569A87),
                labelColor: Color(0xFF569A87),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Travel Itineraries'),
                  Tab(text: 'Reviews'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return listItem(context);
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: SizedBox(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(999)),
                              child: Image.network(
                                'https://pbs.twimg.com/media/EVXnvzMUUAAxWVI.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Tourist',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 10,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: null,
                              ),
                            ],
                          ),
                          subtitle: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.'),
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

  Widget header(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 205,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(127, 3, 51, 51), BlendMode.srcOver),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1615796043540-15fb5f198949?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                          child: Image.network(
                            'https://pbs.twimg.com/media/EVXnvzMUUAAxWVI.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Juan Dela Cruz Jr.',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Zamboanga City',
                        style: GoogleFonts.roboto(
                            color: Colors.white, letterSpacing: 2),
                      ),
                      SizedBox(height: 8.0),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        onRatingUpdate: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TravelItineraryScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 200,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.0), BlendMode.srcOver),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1615320367500-bafc931a2ff0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                color: Color.fromARGB(191, 3, 51, 51),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Travel Itinerary I',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Php 5,000.00',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontStyle: FontStyle.italic,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 30,
                        child: RawMaterialButton(
                          fillColor: Color(0xFF569A87),
                          splashColor: Color(0xFF165A5A),
                          child: Text(
                            "Book Now",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () async {
                            dynamic result;

                            result = await Navigator.pushNamed(context,
                                TouristGuideBookingCheckoutScreen.routeName);

                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result.toString())));
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
