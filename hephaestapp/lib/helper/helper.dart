import 'package:hephaestapp/ui/authentication.dart';
import 'package:hephaestapp/ui/signup.dart';
import 'package:flutter/material.dart';



class Helper extends StatefulWidget {
  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {

  bool showSignIn = true;

  void toogleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn)
    return Authentication(toogleView);
    else
    return SignUp(toogleView);
    
  }
}