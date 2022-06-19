import 'package:flutter/material.dart';
import 'package:laundrywala/functions.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  static const IconData iron = IconData(0xe34e, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    //stop rotating screen
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/wallpaper1.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //  color: Colors.lightBlue,
                margin: EdgeInsets.only(
                  top: 40,
                  left: 10,
                  right: 20,
                ),
                height: 100,
                width: double.infinity,
                child: Row(children: [
                  Hero(tag: 'logo', child: getLogo(80, 80)),
                  searchBar(),
                ]),
              ),
              Container(
                //height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roundButtons('images/dryclean-circle.png',
                          'clothes laundry', context, ''),
                      roundButtons('images/iron-circle.png', 'steam ironing',
                          context, ''),
                      roundButtons('images/laundry-circle.png', 'dry cleaning',
                          context, ''),
                      roundButtons('images/carpet-circle.png',
                          'carpet cleaning', context, ''),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                // color: Colors.pink,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: slideShow(),
              ),
              Divider(
                height: 60,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
              ),
              Text(
                'Services',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              serviceCard(
                  imagePath: 'images/ras.png',
                  label: 'laundry',
                  subtext:
                      'Have a lot of laundries? Give your laundry by kg! Get your clothes clean, fresh and new like the first time you got them.'),
              SizedBox(
                height: 30,
              ),
              serviceCard(
                  imagePath: 'images/steam iron.jpg',
                  label: 'Steam Iron',
                  subtext:
                      'We remove the wrinkles from your fabric with our professional steam ironing technique.'),
              SizedBox(
                height: 30,
              ),
              serviceCard(
                  imagePath: 'images/dry cleaning card.jpg',
                  label: 'Dry cleaning',
                  subtext:
                      'Get the best dry cleaning services with the best technology and expertise at every step. We use most advanced dry cleaning methods.'),
              SizedBox(
                height: 30,
              ),
              serviceCard(
                  imagePath: 'images/carpet clean card.jpg',
                  label: 'Carpet cleaning',
                  subtext:
                      'best carpet cleaning services which include carpet sanitization and washing. All this at your doorstep.'),
              Divider(
                height: 60,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
              ),
              findLaundryCard(context),
              SizedBox(
                height: 40,
              ),
              blueTextButton(70, 'Get Service Now', 15, 20, 0),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
