import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristBookingDetailsScreen extends StatefulWidget {
  static const routeName = '/touristbookingdetailsscreen';
  @override
  _TouristBookingDetailsScreenState createState() =>
      _TouristBookingDetailsScreenState();
}

class _TouristBookingDetailsScreenState
    extends State<TouristBookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text(
              'R#21548625646',
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
                  Text('Tourist Spot'),
                  Text(
                    'Sta Cruz Islands',
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
                  Text('Address'),
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
                  Text('From'),
                  Text(
                    '2021-02-02',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('To'),
                  Text(
                    '2021-02-10',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      trailing: Text(
                        'Php 2,500.00',
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        'Item 1 (Php 500.00 x 5)',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
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
                    "Cancel Booking",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
