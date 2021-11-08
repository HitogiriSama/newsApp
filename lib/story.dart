import 'package:flutter/material.dart';
//import 'package:html/parser.dart';
import 'package:newsapp/models/data.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';

import 'utils/utilities.dart';

class StoryDet extends StatelessWidget {
  final Article d;

  StoryDet({required this.d});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.deepPurple),
                  child: IconButton(

                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_outlined),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${d.title}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black.withOpacity(0.3),
                        //       spreadRadius: 5,
                        //       blurRadius: 7),
                        // ],
                        ),
                    child: Image.network(
                      "https://www.howwebiz.ug/uploads/articles/image_640/thumbnail_640_420/${d.filename}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple.shade900,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '${d.name}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.deepPurple.shade900,
                      ),
                      child: IconButton(
                        // splashColor: Colors.red,
                        // highlightColor: Colors.red,
                          onPressed: () async {
                            final artTitle = '${d.title}';
                            await Share.share(
                                'Check out this story\n\n$artTitle');
                          },
                          icon: Icon(
                            Icons.share,
                            size: 23,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
              // SizedBox(height: 5,),
              Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.black.withOpacity(0.3),
                            //       spreadRadius: 3,
                            //       blurRadius: 7),
                            // ],
                            color: Colors.white10,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                "https://www.howwebiz.ug/uploads//authors/crop_100/${d.publisherFilename}",
                              ),
                            ),
                          ),
                          title: Text(
                            '${d.publishername}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            'Author',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          trailing: Text(
                            '${d.views} Views',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.red[400]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${Utils.parseHtmlString(d.content)}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
