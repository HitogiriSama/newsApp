import 'package:flutter/material.dart';
import 'package:newsapp/models/data.dart';
import 'package:newsapp/models/jason.dart';

import '../story.dart';

class All extends StatefulWidget {
  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Article>>(
            future: ApiCall.fetchArticle(),
            builder: (context, snapShot) {
              final aticos = snapShot.data;
              // final headline =
              // snapShot.data!.where((e) => e.headlinePost == 'yes').toList();

              switch (snapShot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                      heightFactor: 15, child: CircularProgressIndicator());
                default:
                  if (snapShot.hasError) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    ));
                  } else {
                    return listArticles(aticos!);
                  }
              }
            }));
  }

  Widget listArticles(List<Article> aticos) {
    return Container(
        //color: Colors.black,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: aticos != null
                  ? ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(color: Colors.white38),
                      padding: EdgeInsets.all(8.0),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: aticos.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        Article d = aticos[index];

                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StoryDet(d: d))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Text(
                                          '${d.name}',
                                          style: TextStyle(
                                              color: Colors.purple.shade900,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                        );
                      })
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 250.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
            )));
  }
}
