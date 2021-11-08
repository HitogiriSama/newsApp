import 'package:html/parser.dart';

class Utils {
  static String? parseHtmlString(String? htmlString) {
    try {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body?.text).documentElement!.text;
      return parsedString;
    } catch (e) {
      return htmlString;
    }
  }
}
