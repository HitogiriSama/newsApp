import 'dart:convert';
import 'package:newsapp/models/data.dart';
import 'package:http/http.dart' as http;


class ApiCall {

  static Future<List<Article>> fetchArticle() async {

    final response = await http.get(Uri.parse('https://www.howwebiz.ug/restAPI/aticols'));

    // if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;

      return body.map((body) => Article.fromJson(body)).toList();
// }else throw Exception('Loading Failed');
  }
}