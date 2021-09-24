import 'package:hephaestapp/ui/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hephaestapp/ui/home_view.dart';
import 'package:hephaestapp/ui/searchPage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARAKourse',
      theme: new ThemeData(
        fontFamily: 'Helvetica',
        accentColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    );
  }
}

