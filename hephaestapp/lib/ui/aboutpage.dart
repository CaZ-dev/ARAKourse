import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  const Color(0xFFBB80FF),
        title: Text('About Us', style: TextStyle(color: Colors.yellow, fontFamily: 'HelveticaBold', fontSize: 20),),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
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
            Image.asset(
              'images/LogoBlur.png',
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Text(
              'Developed by Hephaestus',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(' This app is developed by students, for students. ',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
            Text(
              ' The app is named after the four developers:',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 20),
          AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TyperAnimatedText('AGAM\nRAGHAV\nABHINAV\nKUHU',
                speed: Duration(milliseconds: 150),
                textAlign: TextAlign.justify,
                textStyle: TextStyle(
              fontSize: 30.0,
              color: Colors.deepPurple,
              fontFamily: 'HelveticaBold',
            ), ),
              ]
            ),
          ],
        ),
        ),
      ),
    );
  }
}
