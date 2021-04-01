import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelItineraryScreen extends StatefulWidget {
  static const routeName = '/travelitinerary';
  @override
  _TravelItineraryScreenState createState() => _TravelItineraryScreenState();
}

class _TravelItineraryScreenState extends State<TravelItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(context),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text('Day ${index + 1} ( 07:00 )'),
                  subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.'),
                ),
              ),
            )
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
                      Text(
                        'Travel Itinerary I',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus nulla nunc, quis feugiat libero eleifend ut. Nullam a auctor sapien.',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: RawMaterialButton(
                          fillColor: Color(0xFF569A87),
                          splashColor: Color(0xFF165A5A),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Book Now ( Php 5,000.00 )",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                        ),
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
}
