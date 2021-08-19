import 'package:dkatalistest/features/view/account/view_personal_information.dart';
import 'package:dkatalistest/features/view/account/view_schedule.dart';
import 'package:flutter/material.dart';

import 'features/view/account/view_email.dart';
import 'features/view/account/view_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        ViewEmail.name: (context) => ViewEmail(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        ViewPassword.name: (context) => ViewPassword(),
        ViewPersonalInformation.name: (context) => ViewPersonalInformation(),
        ViewSchedule.name: (context) => ViewSchedule(),
      },
    );
  }
}
