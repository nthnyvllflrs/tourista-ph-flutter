import 'package:flutter/material.dart';
import 'package:tourista_ph/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourista PH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
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
