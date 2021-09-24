import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hephaestapp/helper/helper.dart';
import 'package:hephaestapp/net/flutterfire.dart';
import 'package:hephaestapp/ui/authentication.dart';
import 'package:hephaestapp/ui/favourites.dart';
import 'package:hephaestapp/ui/home_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hephaestapp/ui/searchPage.dart';

class SplashScreen extends StatefulWidget {
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 10;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  getCurrentUser() ? Home() : Helper()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.3,
                      child:logo(),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                      width: MediaQuery.of(context).size.width /1.3,
                      child: TypewriterAnimatedTextKit(
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      text: [
                      "ARAKourse",
                      ],
                      speed: Duration(milliseconds: 200),
                      textStyle: TextStyle(
                      fontSize: 48.0,
                      fontFamily: "HelveticaBold",
                      color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                    width: MediaQuery.of(context).size.width/1.4,
                    child: ColorizeAnimatedTextKit(
                      speed: Duration(milliseconds: 200),
                      text: [
                        "FIND COURSES.",
                        "COMPARE COURSES.",
                        "TAKE COURSES.",
                      ],
                      textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "HelveticaBold"
                      ),
                      colors: [
                        Colors.deepPurple,
                        Colors.red[900],
                        Colors.blue[900],
                        Colors.deepPurple[900],
                      ],
                      textAlign: TextAlign.center,
                    ),
                  )
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget logo()
  {
    // ignore: missing_required_param
    return new Hero
    (
      tag: 'hero',
      child: Image.asset(
        'images/LogoBlur.png'
      ) 
    );
  }