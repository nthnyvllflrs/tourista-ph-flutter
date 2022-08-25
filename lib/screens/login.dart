import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourista_ph/classes/Authentication.dart';
import 'package:tourista_ph/screens/home.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameTextEdCon = TextEditingController();
  final _passwordTextEdCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://images.unsplash.com/photo-1520454974749-611b7248ffdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'))),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      width: 200,
                      child: Image.network(
                          'https://res.cloudinary.com/nthnyvllflrs/image/upload/v1617093898/tourista.png'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Container(
                          child: TextFormField(
                            controller: _usernameTextEdCon,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // suffixIcon: Icon(Icons.search, color: Color(0xFF569A87)),
                              contentPadding: EdgeInsets.all(16.0),
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Container(
                          child: TextFormField(
                            controller: _passwordTextEdCon,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // suffixIcon: Icon(Icons.search, color: Color(0xFF569A87)),
                              contentPadding: EdgeInsets.all(16.0),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      child: RawMaterialButton(
                        fillColor: Color(0xFF569A87),
                        splashColor: Color(0xFF165A5A),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: Text(
                            "Login",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            // Close keyboard
                            FocusScope.of(context).unfocus();

                            // Show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Color(0xFF569A87),
                                content: Text('Logging in. Please wait...'),
                              ),
                            );

                            // Authentication request
                            final authentication = new Authentication();
                            final response = await authentication.login(
                                _usernameTextEdCon.text,
                                _passwordTextEdCon.text);

                            // Response
                            if (response) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              Navigator.popAndPushNamed(
                                  context, HomeScreen.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFF569A87),
                                  content: Text(
                                      'Something went wrong. Please Try Again.'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Create an account",
                                style: TextStyle(color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Create an account clicked');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
