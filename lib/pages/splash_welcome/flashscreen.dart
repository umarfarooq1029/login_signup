import 'dart:async';
import 'package:loginlogout/loginorlogout/login.dart';
import 'package:loginlogout/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatefulWidget {
  @override
  State<FlashScreen> createState() => FlashScreenState();
}

class FlashScreenState extends State<FlashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();

    LoginFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
    );
  }

  void LoginFunction() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    Timer(Duration(seconds: 5), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }
}
