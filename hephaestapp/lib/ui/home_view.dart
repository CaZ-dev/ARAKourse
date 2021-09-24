import 'package:flutter/material.dart';
import 'package:hephaestapp/categories/category1.dart';
import 'package:hephaestapp/profile/components/profile_screen.dart';
import 'package:hephaestapp/ui/HomePage.dart';
import 'package:hephaestapp/ui/categoryui.dart';
import 'package:hephaestapp/ui/favourites.dart';
import 'searchPage.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CategoryPage(),
    SearchView(),
    ProfileScreen(),
  ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       showUnselectedLabels: true,
       unselectedItemColor: Colors.black,
       backgroundColor: const Color(0xFFBB80FF),
       fixedColor: Colors.yellow,
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home_outlined),
           activeIcon: Icon(Icons.home_rounded),
           title: Text('Home', style: TextStyle(fontSize: 16, fontFamily: 'HelveticaBold'),),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.category_outlined),
           activeIcon: Icon(Icons.category_rounded),
           title: Text('Categories',  style: TextStyle(fontSize: 14, fontFamily: 'HelveticaBold'),),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.search_rounded),
           activeIcon: Icon(Icons.search_sharp),
           title: Text('Search', style: TextStyle(fontSize: 16, fontFamily: 'HelveticaBold'),),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.more_horiz_outlined),
           activeIcon: Icon(Icons.more_horiz_rounded),
           title: Text('More',  style: TextStyle(fontSize: 14, fontFamily: 'HelveticaBold'),),
         ),
       ],
     ),
   );
 }
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}

