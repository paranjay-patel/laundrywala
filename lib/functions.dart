// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:laundrywala/screens/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//variables
PickedFile? imageFile = null;
const IconData dry_cleaning_rounded =
    IconData(0xf6e8, fontFamily: 'MaterialIcons');

//get the logo
getLogo(height, width) {
  // ignore: sized_box_for_whitespace
  return Container(
    width: width.toDouble(),
    height: height.toDouble(),
    child: Image.asset('images/logo.png'),
  );
}

//two color text
twoColorText(string1, string2, double size1, double size2, fontwieght) {
  return RichText(
    text: TextSpan(
      text: string1,
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: size1,
          fontWeight: fontwieght),
      children: <TextSpan>[
        TextSpan(
          text: string2,
          style: TextStyle(
              color: Color.fromARGB(255, 68, 138, 255),
              fontSize: size2,
              fontWeight: fontwieght),
        ),
      ],
    ),
  );
}

//text field rounded
BoxDecoration textfielddecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
  );
}

//when textfield not selected
OutlineInputBorder enableborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide:
          BorderSide(color: Color.fromARGB(255, 139, 139, 139), width: 2.5));
}

//when textfield selected
OutlineInputBorder focusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide:
          BorderSide(color: Color.fromARGB(255, 68, 138, 255), width: 2.5));
}

//searchbar at hometab
Widget searchBar() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(right: 10),
      // width: 200,
      height: 50,
      decoration: textfielddecoration(),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.mic,
            color: Color.fromARGB(255, 112, 112, 112),
          ),
          enabledBorder: enableborder(),
          focusedBorder: focusborder(),
          labelText: "search",
          labelStyle: TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
          hintStyle: TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
        ),
      ),
    ),
  );
}

//rounded button just below search bar in hometab

Widget roundButtons(image_path, label, @required context, @required routeName) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 63,
            width: 63,
            margin: EdgeInsets.all(10),
            child: Image(
              image: AssetImage(image_path),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

//slideshow at hometab

Widget slideShow() {
  var primary = TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
  var secondry = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 114, 114, 114),
  );
  return ImageSlideshow(
    width: double.infinity,
    height: 300,
    initialPage: 0,
    indicatorColor: Colors.transparent,
    indicatorBackgroundColor: Colors.transparent,
    onPageChanged: (value) {
      debugPrint('Page changed: $value');
    },
    autoPlayInterval: 3000,
    isLoop: true,
    children: [
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/111.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'order anytime',
            style: primary,
          ),
          Text('our service is available all days ', style: secondry)
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/222.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'afordable price',
            style: primary,
          ),
          Text('as clothe count gose up , price gose down ', style: secondry)
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/333.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'quality',
            style: primary,
          ),
          Text('quality machines to provide quality service',
              textAlign: TextAlign.center, style: secondry)
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/444.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'total care',
            style: primary,
          ),
          Text('dry cleaning with care and love', style: secondry)
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/555.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'better floor',
            style: primary,
          ),
          Text('make your house looks bettter than ever', style: secondry)
        ],
      ),
    ],
  );
}

//service Cards at home tab

Widget serviceCard({@required imagePath, @required label, @required subtext}) {
  var primary = TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
  var secondry = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 114, 114, 114),
  );
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.symmetric(horizontal: 20),
    elevation: 3,
    shadowColor: Color.fromARGB(255, 0, 60, 255),
    child: Container(
      height: 250,
      width: double.infinity,
      child: Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            //  height: 200,
            child: Image.asset(
              imagePath,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          label,
          style: primary,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(subtext, textAlign: TextAlign.center, style: secondry),
        )
      ]),
    ),
  );
}

//find laundry card at home tab , redirect to google map
Widget findLaundryCard(@required context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, GoogleMaps.id);
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 3,
      shadowColor: Color.fromARGB(255, 0, 60, 255),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 200,
        width: double.infinity,
        child: Row(children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              //  height: 200,
              child: Image.asset(
                'images/map.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
              //   width: 50,
              ),
          Expanded(
            child: Container(
              // width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 92, 92, 92),
                  ),
                  Text(
                    'laundry services nera me',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  blueTextButton(40, 'FIND', 50, 20, 0),
                ],
              ),
            ),
          ),
        ]),
      ),
    ),
  );
}

Widget blueTextButton(
    @required double height, text, double borderRadius, double mh, double mv) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: mh, vertical: mv),
    width: double.infinity,
    height: height,
    //smargin: EdgeInsets.fromLTRB(70, 30, 70, 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: Color.fromARGB(255, 6, 105, 253),
    ),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
  );
}

Widget text(@required text, double fontsize, fontweight, color, {textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color),
  );
}

//text below Icon
Widget textBelowIcon(@required icon, double iconsize, iconcolor, @required text,
    textcolor, double fontsize, fontweight) {
  return Expanded(
    child: Column(
      children: [
        Container(
          // color: Colors.black,
          height: 50,
          width: 50,
          child: Center(
            child: FaIcon(
              icon,
              size: iconsize,
              color: iconcolor,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textcolor, fontWeight: fontweight, fontSize: fontsize),
          ),
        ),
      ],
    ),
  );
}

Widget ordersCard(icon, double iconsize, icontext, number, numColor) {
  return Card(
    // color: Colors.grey,
    elevation: 3,
    shadowColor: numColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      // color: Colors.amber,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 200,
      width: double.infinity,
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textBelowIcon(icon, iconsize, Color.fromARGB(255, 141, 141, 141),
              icontext, Color.fromARGB(255, 56, 56, 56), 16, FontWeight.w400),
          Expanded(
              child: text(number.toString(), 50, FontWeight.bold, numColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text('orders', 16, FontWeight.w300,
                  Color.fromARGB(255, 53, 53, 53)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: numColor,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
//profile  pic for dashboard
// Widget showProfilePic() {
//   return CircleAvatar(
//     radius: 80,
//     backgroundImage: (imageFile == null)
//         ? AssetImage('images/defaultUser.png')
//         : Image.file(
//             File(imageFile!.path),
//             fit: BoxFit.cover,
//           ).image,
//   );
// }
