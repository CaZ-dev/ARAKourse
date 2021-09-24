import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hephaestapp/net/flutterfire.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBB80FF),
        title: Text('Favourites', style: TextStyle(color: Colors.yellow, fontFamily: 'HelveticaBold', fontSize: 24),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Courses').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
               child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xFF8F4CFC),),
                  margin: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
                  child: Column(
                    children:
                    [
                    SizedBox(height: 15),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(width: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text('${document.id}', style: TextStyle(wordSpacing: 4,height: 1.25, color: Colors.white,fontSize: 20, fontFamily: 'HelveticaBold'), textAlign: TextAlign.center,),
                      ),
                    SizedBox(width: 10),
                    SizedBox(child:
                      IconButton(
                      iconSize: 28,
                      icon:Icon(
                      Icons.highlight_remove_rounded,
                      color: Colors.white,
                      ),
                      onPressed: () async{
                        await removeCourse(document.id);
                      },
                    ),
                    ),
                    SizedBox(width: 15),
                  ],
                  ),
                    SizedBox(height: 15),
                    ],
                    ),
                  );
              }
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}