import 'package:flutter/material.dart';
import 'categoryClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:hephaestapp/net/coursedetails.dart';
import 'package:hephaestapp/ui/coursepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatList extends StatelessWidget {
  List searchResponse;
  Map mapResponse = null;
  Map mapResponse1 = null;
  List searchResponse1 = null;
CatList({Key key , @required this.searchResponse});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (Text("Course List", style: TextStyle(fontFamily: 'HelveticaBold', color: Colors.black),)), backgroundColor: const Color(0xFFBB80FF),),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index) {
                return Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0xFF8F4CFC),
                      ),
                  margin: EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 15),
                  child: Column(
                    children: [
                    SizedBox(height: 15),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(searchResponse[index]['title'], textAlign: TextAlign.center, style: TextStyle(height: 1.25 ,wordSpacing: 4, fontSize: 16, fontFamily: 'HelveticaBold', color: Colors.white)),
                    ),
                    SizedBox(width: 20),
                        GestureDetector(
                        onTap: () async{
                        Response searchCourse1;
                        var url = Uri.parse('https://www.udemy.com/api-2.0/courses/${searchResponse[index]['id']}');
                        const String Client_id = '8A5zSXdl0Zqw9msZT8zjIunfJnxm8NMHB8jkxY84';
                        const String Client_Secret = 'QjjfkknVPfRBWJnJDMiCwEswkIevljW4JlendE1gv3nJbBjYDsXPV79Prz4dR7B58KYb5rDUicbCksxAP2NSZrpui4qlDyPas1K93R3D5Jfd7OT5B4eml1g8T7O8F3oH';
                        String auth = base64.encode(utf8.encode('$Client_id:$Client_Secret'));
                        searchCourse1 = await http.get(url ,headers: {"Authorization": "Basic " + auth});
                        if(searchCourse1.statusCode==200){
                        mapResponse1 = json.decode(searchCourse1.body);
                        searchResponse1 = mapResponse1['visible_instructors'];
                        print(searchResponse1);
                        CourseDetail instance = CourseDetail(imgurl: searchResponse[index]['image_480x270'],title:mapResponse1['title'].toString(), price:mapResponse1['price_detail']['amount'].toString(), url:mapResponse1['url'].toString(), instructor: searchResponse1[0]['display_name'].toString(), insturl: searchResponse1[0]['image_100x100'].toString() );
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(title1:instance.title , price1: instance.price, url1: instance.url,instruct:instance.instructor, insturl: instance.insturl,imgurl: instance.imgurl,),
                      ),
                        );

                        }
                        else 
                        {
                          print(searchCourse1.statusCode);
                        }
                       },
                       child: Container(
                        width: 120.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(searchResponse[index]['image_125_H'])),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: const Color(0xFFBB80FF),
                        ),
                      ),
                        ),
                     SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                        await addCourse(searchResponse[index]['title']);
                          },
                          child: Icon(Icons.add_circle_outline_rounded, color: Colors.white,),
                          ),
    
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                  ),
                );
              },
              itemCount: searchResponse== null ? 0 : searchResponse.length
              )
        ],

      ),
      )
    );
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not open $_url!';
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