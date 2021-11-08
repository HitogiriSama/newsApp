import 'dart:ui';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/pages/trendingArt.dart';
import 'package:newsapp/utils/greeting.dart';
import 'articlesCell.dart';
import 'articlesList.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String greetingMes = greetingMessage();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(

          children: [
            Container(
              color: Colors.black38,
              // decoration: BoxDecoration(
              //   gradient: Gradient(
              //     transform: ,
              //     stops: [0.0001,90],
              //     // begin: Alignment.topLeft,
              //     // end: Alignment.bottomRight,
              //     colors: [Colors.purple.shade100, Colors.transparent]
              //
              //   ),
              // ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6,2,2,0),
                    child: Text(greetingMes,style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      color: Colors.white
                      )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Headlines.',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      color: Colors.white
                        ),
                  ),
                ],
              ),
            ),
            ArticlesCell(),
            // SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Latest.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                   ),
              ),
            ),
            ArticlesList(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Trending.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TrendingList(),
          ],
        ),
      ),
    );
  }
}
