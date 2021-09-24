import 'package:hephaestapp/ui/home_view.dart';
import 'package:hephaestapp/ui/authentication.dart';
import 'package:flutter/material.dart';
import 'package:hephaestapp/net/flutterfire.dart';


class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  AuthService authMethod  = new AuthService();

  TextEditingController usernameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  SignMeUp() async{
    if(formKey.currentState.validate()){
     setState(() {
       isLoading = true;
     });

    await authMethod.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val) {
      //print("${val.uid}");
      if(val != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
      ));
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
      body: isLoading ? Container(
        child: Center(
          child:CircularProgressIndicator(),
          ),
      ) :SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
        ),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
              child: Column(
                children: [
                  SizedBox(height:10),
                  logo(),
                  SizedBox(height:30),
                  TextFormField(
                validator: (val) {
                  return val.isEmpty || val.length < 2 ? "This is will not work " : null ;
                },
                controller: usernameTextEditingController,
                style: TextStyle(fontFamily: 'HelveticaBold'),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: 'Helvetica'),
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
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
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) {
                  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                },
                controller: emailTextEditingController,
                style: TextStyle(fontFamily: 'HelveticaBold'),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: 'Helvetica'),
                  hintText: 'Email',
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
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator:  (val){
                      return val.length < 6 ? "Enter Password 6+ characters" : null;
                    },
                controller: passwordTextEditingController,
                style: TextStyle(fontFamily: 'HelveticaBold'),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: 'Helvetica'),
                  hintText: 'Password',
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
              ),
                ],
              ),
              ),
              
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  SignMeUp();
                },
                child: Container(
                alignment: Alignment.center,
                height: 45,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFFBB80FF),
                ),
                child: Text('Sign Up',
                style: TextStyle(fontSize: 24,color: Colors.black),
                ),
              ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  widget.toggleView();
                },
              child:Container(
                alignment: Alignment.center,
                height: 45,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFFEEDFFF),
                ),
                child: Text('Already Have An Account? Login now.',
                style: TextStyle(fontSize: 18,color: Colors.black),
                ),
              ),
              ),
              SizedBox(height: 50,),
            ],
            
          ),
      ),
      ),
      ),
    );
  }
}