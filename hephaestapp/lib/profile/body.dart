import 'package:flutter/material.dart';
import 'package:hephaestapp/ui/aboutpage.dart';
import 'package:hephaestapp/ui/favourites.dart';
import 'profile_menu.dart';
import 'package:hephaestapp/net/flutterfire.dart';
import 'package:hephaestapp/helper/helper.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 35),
        SizedBox
        (
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1.1 ,
          child: Lottie.asset('assets/Book.json', repeat: false),
        ),  
        SizedBox(height: 35),    
        ProfileMenu(
          text: "Favourited Courses",
          icon: Icon(Icons.star, color: Colors.yellow),
          press: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Favourites()));
          }
          ),
              ProfileMenu(
          text: "About Us",
          icon: Icon(Icons.info_rounded, color: Colors.yellow),
          press: () {
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutView()));
          }
          ),

              ProfileMenu(
          text: "Log Out",
          icon: Icon(Icons.logout, color: Colors.yellow),
          press: () {
            signOut();
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Helper()));
          }),


      ],
      
    )
    );
  }
}

