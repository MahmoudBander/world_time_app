// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, deprecated_member_use, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/classes/getdata_class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingpages() async {
    AllCountries oneCountry =
        AllCountries(countryName: "Egypt", flag: "egypt", link: "Africa/Cairo");
    await oneCountry.getData();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timezone,
      "isDayTime": oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingpages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(146, 12, 16, 49),
              size: 150.0,
            )
          ],
        ),
      ),
    );
  }
}
