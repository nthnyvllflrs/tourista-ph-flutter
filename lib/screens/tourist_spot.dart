import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristSpotScreen extends StatefulWidget {
  static const routeName = '/touristspot';
  @override
  _TouristSpotScreenState createState() => _TouristSpotScreenState();
}

class _TouristSpotScreenState extends State<TouristSpotScreen>
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
                        return listItem(context);
                      },
                    ),
                  ),
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
                        return listItem(context);
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

  Widget listItem(BuildContext context) {
    return Container(
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
                        'Menu I',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Php 1,000.00',
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
                          "Order Now",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {},
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
                    'https://images.unsplash.com/photo-1615320367500-bafc931a2ff0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
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
                      Text(
                        'Sta Cruz Island',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Zamboanga City',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Sta Cruz Island, Zamboanga City',
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
        ],
      ),
    );
  }
}
