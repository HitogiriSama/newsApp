// import 'dart:convert';
// import 'dart:ui';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/story.dart';
//import 'articlesList.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer/shimmer.dart';
import 'models/data.dart';
import 'models/jason.dart';

class ArticlesCell extends StatefulWidget {
  @override
  State<ArticlesCell> createState() => _ArticlesCellState();
}

class _ArticlesCellState extends State<ArticlesCell> {
  // List<Article>? articlesData;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 405,
      child: FutureBuilder<List<Article>>(
          future: ApiCall.fetchArticle(),
          builder: (context, snapShot) {
            // final aticos = snapShot.data;
            final headline =
                snapShot.data?.where((e) => e.headlinePost == 'yes').toList();

            switch (snapShot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    heightFactor: 10,
                    child: CircularProgressIndicator());
              default:
                if (snapShot.hasError) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                } else {
                  return buildArticles(headline!);
                }
            }
          }),
    );
  }

  Widget buildArticles(List<Article> headline) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              height: 400,
              child: headline != null? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: headline.length = 5,
                itemBuilder: (BuildContext ctxt, int index) {
                  Article d = headline[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => StoryDet(d: d))),
                    child: Stack(
                      children: [
                        Container(
                          height: 400,
                          width: 310,
                          margin: EdgeInsets.all(7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://www.howwebiz.ug/uploads/articles/image_640/thumbnail_640_420/${d.filename}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: 310,
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.0),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black, Colors.transparent])),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: Colors.black26,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '${d.name}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),

                                Text(
                                  '${d.alternativeHeadline}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ) : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 250.0),
                      child: CircularProgressIndicator(),))
          ),
        ),
      ],
    );
  }
}
