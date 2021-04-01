import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourista_ph/screens/tourist_guide.dart';
import 'package:tourista_ph/screens/tourist_spot.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1615320367500-bafc931a2ff0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1615894253818-a71a88485fa8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
    'https://images.unsplash.com/photo-1615922219168-e92dc3866303?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1615880325038-4140d19e0bf9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
    'https://images.unsplash.com/photo-1615880325185-c794f749b92c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
    'https://images.unsplash.com/photo-1615306084840-7b18401354a4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => touristSpot(context, item),
        )
        .toList();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              SizedBox(height: 8.0),
              popularTouristSpots(imageSliders),
              SizedBox(height: 8.0),
              nearbyTouristSpots(imageSliders),
              SizedBox(height: 8.0),
              popularTouristGuides(imageSliders),
            ],
          ),
        ),
      ),
    );
  }

  Widget touristSpot(BuildContext context, String item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TouristSpotScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Tourist Spot ${imgList.indexOf(item) + 1}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        onRatingUpdate: null,
                        // onRatingUpdate: (rating) {
                        //   print(rating);
                        // },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: -45,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1615796043540-15fb5f198949?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tourista PH',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SizedBox(
                width: 100,
                child: Image.network(
                    'https://res.cloudinary.com/nthnyvllflrs/image/upload/v1617093898/tourista.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {}
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search, color: Color(0xFF569A87)),
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget popularTouristSpots(imageSliders) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Tourist Spots',
                style: GoogleFonts.roboto(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'See More',
                style: GoogleFonts.roboto(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.black12,
          width: double.infinity,
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              // autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ),
      ],
    );
  }

  Widget nearbyTouristSpots(imageSliders) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby Tourist Spots',
                style: GoogleFonts.roboto(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'See More',
                style: GoogleFonts.roboto(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.black12,
          width: double.infinity,
          height: 150,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 3.0,
            ),
            items: imageSliders,
          ),
        ),
      ],
    );
  }

  Widget popularTouristGuides(imageSliders) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Tourist Guides',
                style: GoogleFonts.roboto(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'See More',
                style: GoogleFonts.roboto(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => touristGuide(context),
          ),
        ),
      ],
    );
  }

  Widget touristGuide(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TouristGuideScreen.routeName);
      },
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
              'Tourist Guide Sr.',
              style: GoogleFonts.roboto(
                  fontSize: 12.0, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.0),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
          ],
        ),
      ),
    );
  }
}
