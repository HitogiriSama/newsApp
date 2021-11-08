import 'package:flutter/material.dart';
import 'package:newsapp/pages/searchpage.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/tabz.dart';

import 'pages/more.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int index = 0;
  final screens = [
    MyHomePage(),
    Tabz(),
    Saachi(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.purple[200],
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500))),
        child: NavigationBar(
          selectedIndex: index,
          //labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() => this.index = index),
          height: 70,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.space_dashboard_outlined),
                selectedIcon: Icon(Icons.space_dashboard_rounded),
                label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search_rounded),
                label: 'Search'),
            NavigationDestination(
                icon: Icon(Icons.more_vert),
                selectedIcon: Icon(Icons.more_vert_sharp),
                label: 'More'),
          ],
        ),
      ),
    );
  }
}
