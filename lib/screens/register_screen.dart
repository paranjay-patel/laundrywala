import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundrywala/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laundrywala/screens/home_screen.dart';
import 'package:laundrywala/screens/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registrationPage';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //authentication instance

  final _auth = FirebaseAuth.instance;
  String username = '';
  String email = '';
  String phonenumber = '';
  String password = '';

  @override
  void initState() {
    passwordFocusNode = FocusNode();
  }

  //validation

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  // var val;
  // This function is triggered when the user press the "Sign Up" button
  // void trySubmitForm() {
  //   final bool? isValid = formKey.currentState?.validate();
  //   if (isValid == true) {
  //     debugPrint('Everything looks good!');
  //   }
  // }

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
                SizedBox(height: 50),
                Hero(tag: 'logo', child: getLogo(100, 100)),
                SizedBox(height: 30),
                twoColorText(
                    'register to ', 'laundrywala', 20, 23, FontWeight.w600),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: textfielddecoration(),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color.fromARGB(255, 0, 0, 0),
                      hoverColor: Colors.amber,
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                      labelText: 'username',
                      hintText: 'Enter username',
                      enabledBorder: enableborder(),
                      focusedBorder: focusborder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 5) {
                        return 'Username must be at least 5 characters in length';
                      }
                      // Return null if the entered username is valid
                      return null;
                    },
                    onChanged: (value) => {
                      username = value,
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: textfielddecoration(),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email address';
                      }
                      // Check if the entered email has the right format
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'This field is required';
                      }
                      // Return null if the entered email is valid
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
                      labelText: "email",
                      hintText: "enter email",
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
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'phone number',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 112, 112, 112)),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 112, 112, 112)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                        hintText: 'Enter your number',
                        enabledBorder: enableborder(),
                        focusedBorder: focusborder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.length != 10) {
                          return 'Username must be at least 10 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) {
                        phonenumber = value;
                      }),
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
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                    80,
                    30,
                    80,
                    10,
                  ),
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
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginPage.id, (route) => false);
                            setState(() {
                              showSpinner = false;
                            });
                            print('new user created');
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        formKey.currentState!.save();
                        print('=== invaliad ===');
                      }
                      ;
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  child: twoColorText("don't have account?", 'LOGIN', 14, 16,
                      FontWeight.normal),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.id, (route) => false);
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
}
