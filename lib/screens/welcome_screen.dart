import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:laundrywala/functions.dart';
import 'package:laundrywala/screens/login_screen.dart';
import 'package:laundrywala/screens/register_screen.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/wallpaper1.png'),
          ),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Hero(tag: 'logo', child: getLogo(130, 130)),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 50),
              width: 300,
              height: 100,
              child: twoColorText(
                  'Laundry Services at your ', 'door', 32, 35, FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  'making laundary system digitalized ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 97, 97, 97),
                    fontSize: 15,
                  ),
                )),
            Container(
                margin: EdgeInsets.all(15),
                child: Image.asset('images/welcome.png')),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(70, 30, 70, 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RegistrationPage.id, (route) => false);
                },
                child: Text(
                  'GET START',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
