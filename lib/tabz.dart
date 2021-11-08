import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:newsapp/articlesList.dart';

import 'categoliz/all.dart';
import 'categoliz/celeb.dart';
import 'categoliz/enta.dart';
import 'categoliz/music.dart';
import 'categoliz/nationa.dart';
import 'categoliz/show.dart';



class Tabz extends StatefulWidget {
  const Tabz({Key? key}) : super(key: key);

  @override
  _TabzState createState() => _TabzState();
}

class _TabzState extends State<Tabz> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(

            title: Text(
              'Browse',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            elevation: 0,
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Entertainment'),
                Tab(text: 'Showbiz'),
                Tab(text: 'Celebrity'),
                Tab(text: 'Music'),
                Tab(text: 'National'),
              ],
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
              unselectedLabelColor: Colors.deepPurple.shade900,
              indicatorSize: TabBarIndicatorSize.label,

            )),
        body: TabBarView(
          children: [
            All(),
            Enta(),
            Show(),
            Celeb(),
            Music(),
            National(),
          ],
        ),
      ),
    );
  }
}
