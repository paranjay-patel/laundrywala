import 'package:flutter/material.dart';
import 'package:laundrywala/screens/welcome_screen.dart';
import 'package:laundrywala/screens/login_screen.dart';
import 'package:laundrywala/screens/register_screen.dart';
import 'package:laundrywala/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laundrywala/screens/google_maps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const primarycolor = Color.fromARGB(255, 6, 105, 253);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primarycolor,
        fontFamily: 'Poppins',
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),

      initialRoute: HomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        HomePage.id: (context) => HomePage(),
        GoogleMaps.id: (context) => GoogleMaps(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
