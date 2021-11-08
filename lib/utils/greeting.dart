
import 'package:intl/intl.dart';

String greetingMessage(){

  DateTime now = DateTime.now();
var timeNow = int.parse(DateFormat('kk').format(now));

  if (timeNow < 12) {
    return 'Good Morning';
  } else if ((timeNow >= 12) && (timeNow <= 16)) {
    return 'Good Afternoon';
  } else if ((timeNow > 16) && (timeNow <= 20)) {
    return 'Good Evening';
  } else if ((timeNow > 20)&& (timeNow <= 24)){
    return 'Good Night';
  } else {
    return 'Good Morning';
  }
}