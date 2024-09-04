// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';



// AllCountries(
//         link: 'Africa/Algiers',
//         countryName: 'Algeria - Algiers',
//         flag: 'algeria.png'),
class AllCountries {
  String flag;
  String countryName;
  String link;
  AllCountries({required this.countryName, required this.flag, required this.link});

  late String timeNow;
  late String timezone;
  late bool isDayTime;
  getData() async {
    Response receivedDataFromAPI = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedData = jsonDecode(receivedDataFromAPI.body);
    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);

    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    DateTime realTime = dateTime.add(Duration(hours: offset));
    print(realTime.hour);

    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat("hh:mm a").format(realTime);
    timezone = receivedData["timezone"];
  }
}
