import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:hephaestapp/net/coursedetails.dart';
import 'package:hephaestapp/ui/coursepage.dart';
import 'package:hephaestapp/net/flutterfire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final formKey = GlobalKey<FormState>();
  String searchTerm;
  Map mapResponse = null;
  List searchResponse = null;
  Map mapResponse1 = null;
  List searchResponse1 = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        [
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
          child: Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            [
              SizedBox(
              width: 250,
              child: TextFormField(
                style: TextStyle(fontFamily: 'HelveticaBold'),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Search Courses",
                hintStyle: TextStyle(fontFamily: 'Helvetica'),
                prefixIcon: Icon(Icons.search_sharp, color: const Color(0xFF8F4CFC)),
                border: OutlineInputBorder
                (
                borderSide: BorderSide(width: 3.0),
                borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder
                (
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 3.0, color: Colors.deepPurple),
                ),
              ),
              validator: (value)
                {
                  return value.isEmpty ? 'No search term provided!' : null;
                },
                onSaved: (value)
                {
                  return searchTerm = value;
                } ,
              
            ),
              ),
              SizedBox(width: 8),
              Container(
              width: MediaQuery.of(context).size.width / 4.5,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFBB80FF),

              ),
              child: MaterialButton(
              textColor: Colors.purple,
              onPressed: () async {
                final form = formKey.currentState;
                if(form.validate())
                {
                form.save();
                Response searchCourse;
                var url = Uri.parse('https://www.udemy.com/api-2.0/courses/?search=${searchTerm}');
                const String Client_id = '8A5zSXdl0Zqw9msZT8zjIunfJnxm8NMHB8jkxY84';
                const String Client_Secret = 'QjjfkknVPfRBWJnJDMiCwEswkIevljW4JlendE1gv3nJbBjYDsXPV79Prz4dR7B58KYb5rDUicbCksxAP2NSZrpui4qlDyPas1K93R3D5Jfd7OT5B4eml1g8T7O8F3oH';
                String auth = base64.encode(utf8.encode('$Client_id:$Client_Secret'));
                searchCourse = await http.get(url ,headers: {"Authorization": "Basic " + auth});
                if(searchCourse.statusCode==200){
                    setState(() {
                mapResponse = json.decode(searchCourse.body);
                searchResponse = mapResponse['results'];
                //print(searchResponse);
                });
                }
                }
                },
              child: Text('Search', style: new TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'HelveticaBold'),)
            ),
            ),
            ]
            ),
            ),
          ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                    child: Text(searchResponse[index]['title'], textAlign: TextAlign.center, style: TextStyle(height: 1.25 ,wordSpacing: 4, color: Colors.white,fontSize: 16,  fontFamily: 'HelveticaBold')),
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
                              setState(() {
                        mapResponse1 = json.decode(searchCourse1.body);
                        searchResponse1 = mapResponse1['visible_instructors'];
                        print(searchResponse1);
                        CourseDetail instance = CourseDetail(imgurl: searchResponse[index]['image_480x270'],title:mapResponse1['title'].toString(), price:mapResponse1['price_detail']['amount'].toString(), url:mapResponse1['url'].toString(), instructor: searchResponse1[0]['display_name'].toString(), insturl: searchResponse1[0]['image_100x100'].toString() );
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(title1:instance.title , price1: instance.price, url1: instance.url,instruct:instance.instructor, insturl: instance.insturl,imgurl: instance.imgurl,),
                      ),
                        );

                        });
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
}