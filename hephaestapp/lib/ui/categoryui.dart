import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hephaestapp/categories/category1.dart';
import 'package:hephaestapp/categories/category2.dart';
import 'package:hephaestapp/categories/category3.dart';
import 'package:hephaestapp/categories/category4.dart';
import 'package:hephaestapp/categories/category5.dart';
import 'package:hephaestapp/categories/category6.dart';
import 'package:hephaestapp/categories/category7.dart';
import 'package:hephaestapp/categories/category8.dart';

class CategoryPage extends StatefulWidget {

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFBB80FF),
        title: Text('Categories', style: TextStyle(color: Colors.yellow, fontFamily: 'HelveticaBold')),
      ),
      body: GridView.count(
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          primary: false,
          children: <Widget>[
            Categories(),
            Categories2(),
            Categories3(),
            Categories4(),
            Categories5(),
            Categories6(),
            Categories7(),
            Categories8(),
          ],
          crossAxisCount: 2),
    );
  }
}
