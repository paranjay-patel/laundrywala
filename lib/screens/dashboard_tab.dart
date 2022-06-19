import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundrywala/functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundrywala/main.dart';

class DashBoardTab extends StatefulWidget {
//variables
  PickedFile? imageFile = null;
  @override
  State<DashBoardTab> createState() => _DashBoardTabState();
}

class _DashBoardTabState extends State<DashBoardTab> {
  //dialog box to choose photo from gallery and camera
  Future<void> showChoiceDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choose option",
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Divider(
                  height: 1,
                  //color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    openGallery(context);
                  },
                  title: Text("Gallery"),
                  leading: Icon(
                    Icons.account_box,
                    //color: Colors.blue,
                  ),
                ),
                Divider(
                  height: 1,
                  //color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    openCamera(context);
                  },
                  title: Text("Camera"),
                  leading: Icon(
                    Icons.camera,
                    // color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget imagepicker(@required double height, @required double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          //color: Color.fromARGB(255, 198, 198, 198),
          borderRadius: BorderRadius.circular(100)),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: height,
              width: width,
              child: CircleAvatar(
                // backgroundColor: Colors.blue,
                radius: 100,
                child: CircleAvatar(
                  radius: 100 - 5,
                  backgroundImage: (imageFile == null)
                      ? AssetImage('images/default user.jpg')
                      : Image.file(
                          File(imageFile!.path),
                          fit: BoxFit.cover,
                        ).image,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 30,
              width: 30,
              child: FloatingActionButton(
                // backgroundColor: Colors.red,
                onPressed: () {
                  showChoiceDialog();
                },
                child: Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

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
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              imagepicker(130, 130),
              SizedBox(height: 20),
              text('paranjay', 24, FontWeight.bold, Colors.blueAccent),
              text('+9877569363', 15, FontWeight.normal,
                  Color.fromARGB(255, 114, 114, 114)),
              SizedBox(
                height: 15,
              ),
              text('Address', 17, FontWeight.w400, Colors.black),
              text('H-502 , Vr mall , near bhatar, Bardoliii', 15,
                  FontWeight.w300, Color.fromARGB(255, 114, 114, 114),
                  textAlign: TextAlign.center),
              Divider(
                height: 70,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.redAccent,
                child: Container(
                  //  color: Colors.blue,
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      text(
                        'Current Orders!!',
                        18,
                        FontWeight.w600,
                        Colors.white,
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                        // indent: 30,
                        endIndent: 30,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          textBelowIcon(
                              Icons.iron,
                              50,
                              Colors.white,
                              '12 clothes are on the way',
                              Colors.white,
                              13,
                              FontWeight.w300),
                          textBelowIcon(
                              FontAwesomeIcons.tshirt,
                              30,
                              Colors.white,
                              '3 clothes will delivered today',
                              Colors.white,
                              13,
                              FontWeight.w300),
                          textBelowIcon(
                              dry_cleaning_rounded,
                              45,
                              Colors.white,
                              '23 clothes will dilivered tommorow',
                              Colors.white,
                              13,
                              FontWeight.w300),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 70,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
              ),
              text('your orders', 20, FontWeight.bold, Colors.black),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          ordersCard(Icons.iron, 60, 'iron', 7, Colors.blue)),
                  Expanded(
                      child: ordersCard(FontAwesomeIcons.shirt, 40, 'laundry',
                          12, Colors.orange)),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: ordersCard(Icons.cleaning_services, 50, 'carpet ',
                          35, Colors.red)),
                  Expanded(
                      child: ordersCard(dry_cleaning_rounded, 60,
                          'dry cleaning', 23, Colors.green)),
                ],
              ),
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
