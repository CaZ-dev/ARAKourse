import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephaestapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  Userqw _userfromfirebaseUser(User user){
    return user !=null ? Userqw(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseuser = result.user;
      return _userfromfirebaseUser(firebaseuser);
     } on FirebaseAuthException catch (e) {
       Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP,timeInSecForIosWeb: 5,textColor: Colors.deepPurple, backgroundColor: Colors.deepPurple[100]);
 }
    
     catch (e) {
        print(e.toString());
        return null;
    }
  }

   

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = result.user;
      return _userfromfirebaseUser(firebaseuser);
    } on FirebaseAuthException catch (e) {
   Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP,timeInSecForIosWeb: 5,textColor: Colors.deepPurple, backgroundColor: Colors.deepPurple[100]);
 }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}

Future <bool> addCourse(String courseid) async {
String uid = FirebaseAuth.instance.currentUser.uid;
DocumentReference documentReference = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Courses').doc(courseid);
FirebaseFirestore.instance.runTransaction((transaction) async{
DocumentSnapshot snapshot = await transaction.get(documentReference);
  documentReference.set({'Course': courseid});
  return true;
});

}

Future<bool> removeCourse(String courseid) async{
String uid = FirebaseAuth.instance.currentUser.uid;
FirebaseFirestore.instance.collection('Users').doc(uid).collection('Courses').doc(courseid).delete();
return true;
}

















Future<bool> signIn(String email, String password) async {
  try{

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }
  catch(e){
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
 try{
   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  return true;
 } on FirebaseAuthException catch (e) {
   if (e.code == 'weak-password') {
     print('The passsword provided is too weak.');
   } else if ( e.code == 'email-already-in-use') {
     print('The account already exists for that email.');
   }
   return false;
 } catch (e) {
   print(e.toString());
   return false;
 }
}

bool getCurrentUser()
{
  if(FirebaseAuth.instance.currentUser != null){
    return true;
  }
return false;
}

void signOut()
{
  FirebaseAuth.instance.signOut();
  
}