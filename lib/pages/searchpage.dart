//import 'package:flutter_html/shims/dart_ui_real.dart';
import 'dart:convert';
import 'package:newsapp/models/data.dart';
import 'package:newsapp/story.dart';
import 'package:search_page/search_page.dart';
import '../articlesList.dart';
import '../models/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Saachi extends StatefulWidget {
  @override
  State<Saachi> createState() => _SaachiState();
}

class _SaachiState extends State<Saachi> {

  List<Article>? articlesData;

  fetchArticle() async {

    final response =
        await http.get(Uri.parse('https://www.howwebiz.ug/restAPI/aticols'));


    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);

      var articleObjsJson = jsonresponse as List;
      List<Article> articlesList = articleObjsJson
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();

      if(mounted)
      setState(() {
        articlesData = articlesList;
      });

    } else {
      throw Exception('Loading Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Text(
                  'Search',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        style:  TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.white),
                        readOnly: true,
                        //controller: textEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search Articles',
                          contentPadding: EdgeInsets.all(13.0),
                        ),
                        onTap: () => showSearch(
                          context: context,
                          delegate: SearchPage<Article>(
                            barTheme: ThemeData(
                                inputDecorationTheme: InputDecorationTheme(
                                  // fillColor: Colors.teal,
                                  border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20),),
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                appBarTheme: AppBarTheme(
                                    // elevation: 0,
                                    backgroundColor: Colors.black26)),
                            //onQueryUpdate: (s) => print(s),
                            items: articlesData!, //==null? articlesData!:[],
                            searchLabel: 'Search Articles',
                            searchStyle: TextStyle(fontSize: 16, fontFamily: 'Poppins'),

                            suggestion: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 200,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  Text('Filter article by title & category',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20)),
                                ],
                              ),
                            ),
                            failure: const Center(
                              child: Text(
                                'No Data :(',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Colors.red),
                              ),
                            ),
                            filter: (articlesData) => [
                              articlesData.name,
                              articlesData.title,
                            ],
                            builder: (articlesData) => GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          StoryDet(d: articlesData))),
                              child: ListTile(
                                title: Text(
                                  "${articlesData.title}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text("${articlesData.name}",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,

                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Text(
                  'Latest News',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(child: ArticlesList())
            ],
          ),
        ),
      ),
    );
  }
}

// class SearchArt extends SearchDelegate {
// // final List<Article>? articlesData;
//
// //   SearchArt(this.articlesData);
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: Icon(Icons.arrow_back),
//         onPressed: () {
//           close(context, null);
//         });
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(
//       child: Text(query),
//     );
//   }
// }
