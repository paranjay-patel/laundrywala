import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:laundrywala/functions.dart';
import 'package:laundrywala/screens/home_screen.dart';
import 'package:laundrywala/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundrywala/screens/welcome_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//firebase Authentication
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

//validation

  @override
  void initState() {
    passwordFocusNode = FocusNode();
  }

  //validation
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  bool showPassword = true;
  bool _obscureText = true;
  bool showSpinner = false;

  late FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
            child: Form(
              key: formKey,
              child: Column(children: [
                SizedBox(height: 100),
                Hero(tag: 'logo', child: getLogo(130, 130)),
                SizedBox(height: 100),
                twoColorText(
                    'login to ', 'laundrywala', 20, 23, FontWeight.w600),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: textfielddecoration(),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                      enabledBorder: enableborder(),
                      focusedBorder: focusborder(),
                      // labelText: "Email",
                      hintText: "email",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  width: double.infinity,
                  decoration: textfielddecoration(),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                      enabledBorder: enableborder(),
                      focusedBorder: focusborder(),
                      // labelText: 'password',
                      hintText: 'password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          color: Color.fromARGB(255, 112, 112, 112),
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel:
                              _obscureText ? 'show password' : 'hide password',
                        ),
                      ),
                    ),
                    focusNode: passwordFocusNode,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      });
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 5) {
                        return 'Username must be greater then 5 characters in length';
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(right: 30),
                  child: Text('forgot password?'),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(80, 30, 80, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            setState(() {
                              showSpinner = false;
                            });
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.id, (route) => false);
                          }
                        } catch (e) {
                          print(e);
                          print('wrong credentials alert box');
                          showAlertDialog(context);
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      } else {
                        formKey.currentState!.save();
                        print('=== invaliad ===');
                      }
                      ;
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  child: twoColorText("don't have account?", 'REGISTER', 14, 16,
                      FontWeight.normal),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, WelcomePage.id, (route) => false);
                  },
                ),
                SizedBox(height: 50),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("wrong credentials"),
      content: Text("please enter valid email and password"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
