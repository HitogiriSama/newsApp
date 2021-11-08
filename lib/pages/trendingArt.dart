// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/models/data.dart';
import 'package:newsapp/models/jason.dart';
import '../story.dart';


class TrendingList extends StatefulWidget {
  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Article>>(
            future: ApiCall.fetchArticle(),
            builder: (context, snapShot) {
              //final aticos = snapShot.data;
              final trending =
              snapShot.data?.where((e) => int.parse ("${e.views}") > 1000 ).toList();

              switch (snapShot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                      heightFactor: 15,
                      child: CircularProgressIndicator());
                default:
                  if (snapShot.hasError) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ));
                  } else {
                    return trendArticles(trending!);
                  }
              }
            }));
  }

  Widget trendArticles(List<Article> trending) {
    return Container(
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child:
              trending != null?
              ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.white38,),
                  reverse: true,
                  padding: EdgeInsets.all(8.0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: trending.length = 6,
                  itemBuilder: (BuildContext ctxt, int index) {
                    Article d = trending[index];

                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => StoryDet(d: d))),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://www.howwebiz.ug/uploads/articles/image_640/thumbnail_640_420/${d.filename}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${d.alternativeHeadline}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Poppins',
                                          color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${d.name}',
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            // Text(
                                            //   '${d.views} Views',
                                            //   style: TextStyle(
                                            //       color: Colors.redAccent,
                                            //       fontFamily: 'Poppins',
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.w700),
                                            // ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }) : Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 250.0),
                            child: CircularProgressIndicator(),
                ) ,
              ),
            )) );
  }
}
