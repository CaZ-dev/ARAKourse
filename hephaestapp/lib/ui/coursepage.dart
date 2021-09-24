import 'package:flutter/material.dart';
import 'package:hephaestapp/net/coursedetails.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
 final String title1;
  final String imgurl;
  final String price1;
  final String url1;
  final String instruct;
  final String insturl;
Details({Key key , @required this.title1, this.price1,this.url1,this.instruct,this.insturl,this.imgurl});
  @override
  Widget build(BuildContext context) {
    String urlFinal = 'https://www.udemy.com'+url1;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(title: (Text("Course Details", style: TextStyle(height: 1.25 ,wordSpacing: 4,fontFamily: 'HelveticaBold', color: Colors.black),)), backgroundColor:const Color(0xFFBB80FF), elevation: 0,),
      body: Container(
        margin: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
        child: SingleChildScrollView(
        child: Column
        (
          mainAxisAlignment : MainAxisAlignment.start,
          children: 
          [
            SizedBox(height: 10),
            Container(
                        width: MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.height / 4 ,
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(imgurl),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(width: 2, color: Colors.deepPurple),
                        ),
                      ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(title1, textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontFamily: 'HelveticaBold')),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text('Price: ₹'+price1, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontFamily: 'HelveticaBold')),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                 _launchURL(urlFinal);
                },
                child: Container(
                alignment: Alignment.center,
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFFBB80FF),
                ),
                child: Text('Check this course out',
                style: TextStyle(fontSize: 20,color: Colors.black, fontFamily: 'HelveticaBold'),
                ),
              ),
              ),
              SizedBox(height: 30),
              SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text('Instructor in this course:', textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: new CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(insturl),
              )
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(instruct, textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: Colors.black, fontFamily: 'HelveticaBold'))
            )
          ],
        ),
        ),
      )
      );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not open $_url!';