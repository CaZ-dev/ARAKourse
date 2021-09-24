import 'package:hephaestapp/net/flutterfire.dart';
import 'package:hephaestapp/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {

final Function toggleView;
Authentication(this.toggleView);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
TextEditingController _emailfield = TextEditingController();
TextEditingController _passwordfield = TextEditingController();

AuthService authService = new AuthService();
final formKey = GlobalKey<FormState>();
 bool isLoading = false;

 signIn() async {
   
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService.signInWithEmailAndPassword(_emailfield.text, _passwordfield.text).then((result) async {
        if(result != null){
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
      }
      else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
        } 
        
 }

  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: const Color(0xfffbf9ff),),
      backgroundColor: const Color(0xFFFFFFFF),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
        ),
        child: Form(
          key: formKey,
        child: Column(
          
          children: [
            SizedBox(height:10),
            logo(),
            SizedBox(height:30),
            TextFormField(
              style: TextStyle(fontFamily: 'HelveticaBold'),
              controller: _emailfield,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(fontFamily: 'Helvetica'),
                prefixIcon: Icon(Icons.email_rounded, color: Colors.deepPurple),
                border: OutlineInputBorder
                (
                borderSide: BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder
                (
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
                ),
              ),
              validator: (value)
                {
                  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? null : "Please Enter Correct Email";
                },
              
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(fontFamily: 'HelveticaBold'),
              controller: _passwordfield,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontFamily: 'Helvetica'),
                prefixIcon: Icon(Icons.vpn_key, color: Colors.deepPurple),
                border: OutlineInputBorder
                (
                borderSide: BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder
                (
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
                ),
              ),
                        validator: (value) {
                            return value.length > 6
                                ? null
                                : "Enter Password 6+ characters";
                          },
        
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xFFBB80FF),

              ),
              child: MaterialButton(
              textColor: Colors.black,
              onPressed: () async {
                signIn();
                },

              child: Text('Login', style: new TextStyle(fontSize: 24.0,),),
            ),
            ),
            SizedBox(height:20),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xFFEEDFFF),

              ),
              child: MaterialButton(
              
              onPressed: () {
                widget.toggleView();
                },
              child: Text('Create an account now.', style: new TextStyle(fontSize: 20.0)),
            )
            ),
            ]),
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

      child: new CircleAvatar
      (
        backgroundColor: Colors.transparent,
        child: Image.asset('images/LogoBlur.png'), //ADD APP LOGO HERE *****
        radius: 110.0,
      ),
    );
  }
