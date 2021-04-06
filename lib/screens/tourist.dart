import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristScreen extends StatefulWidget {
  static const routeName = '/touristscreen';
  @override
  _TouristScreenState createState() => _TouristScreenState();
}

class _TouristScreenState extends State<TouristScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _contactNumberController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = 'Tourist Guide';
    _addressController.text = 'C. Atilano, Tetuan';
    _cityController.text = 'Zamboanga City';
    _contactNumberController.text = '999-9999';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            header(context),
            textField('Name', _nameController),
            textField('City', _cityController),
            textField('Address', _addressController),
            textField('Contact Number', _contactNumberController),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color(0xFF569A87),
                splashColor: Color(0xFF165A5A),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Update Profile",
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
          ]),
        ),
      ),
    );
  }

  Container textField(String hintText, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Container(
          child: TextFormField(
            enabled: false,
            controller: controller,
            validator: (value) {
              if (value.isEmpty) {}
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(16.0),
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(24.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(24.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(24.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(999)),
                              child: Image.network(
                                'https://pbs.twimg.com/media/EVXnvzMUUAAxWVI.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 125,
                            height: 125,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(999)),
                              child: Image.network(
                                'https://res.cloudinary.com/nthnyvllflrs/image/upload/v1617693807/badge.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
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
