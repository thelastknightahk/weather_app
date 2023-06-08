import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:wealther_app/global/models/day_model.dart';

class FunctionsHelper {
  static String convertDateFormat(String dateString) {
    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm').parse(dateString);

    String time = DateFormat('h:mm a').format(dateTime);
    return time;
  }

  static int hourDifference(String hourData) {
    DateTime now = DateTime.now();

    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm').parse(hourData);
    Duration duration = dateTime.difference(now);
    int hourDifference = duration.inHours;
    return hourDifference;
  }

  static List<DayModel> dayList() {
    List<DayModel> dayList = [];
    DateTime now = DateTime.now();

    int dayOfWeek = now.weekday; // Output: 6 (assuming today is Saturday)

    switch (dayOfWeek) {
      case 1:
        dayList = [
          DayModel(dayName: 'Mon', selected: true),
          DayModel(dayName: 'Tue', selected: false),
          DayModel(dayName: 'Wed', selected: false)
        ];
        break;
      case 2:
        dayList = [
          DayModel(dayName: 'Tue', selected: true),
          DayModel(dayName: 'Wed', selected: false),
          DayModel(dayName: 'Thur', selected: false),
        ];
        break;
      case 3:
        dayList = [
          DayModel(dayName: 'Wed', selected: true),
          DayModel(dayName: 'Thur', selected: false),
          DayModel(dayName: 'Fri', selected: false),
        ];
        break;
      case 4:
        dayList = [
          DayModel(dayName: 'Thur', selected: true),
          DayModel(dayName: 'Fri', selected: false),
          DayModel(dayName: 'Sat', selected: false),
        ];
        break;
      case 5:
        dayList = [
          DayModel(dayName: 'Fri', selected: true),
          DayModel(dayName: 'Sat', selected: false),
          DayModel(dayName: 'Sun', selected: false),
        ];
        break;
      case 6:
        dayList = [
          DayModel(dayName: 'Sat', selected: true),
          DayModel(dayName: 'Sun', selected: false),
          DayModel(dayName: 'Mon', selected: false),
        ];
        break;
      case 7:
        dayList = [
          DayModel(dayName: 'Sun', selected: true),
          DayModel(dayName: 'Mon', selected: false),
          DayModel(dayName: 'Tue', selected: false),
        ];
        break;
      default:
        dayList = [];
    }

    return dayList;
  }
}
