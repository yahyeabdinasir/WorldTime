import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loading.dart';

// so this si the default way that we can import the package using the naming convetation
// and also this way we can use like that we just use the name of the flutter app and the package so then
// we don't need to specify the directory that called the lib no more when it comes the package
// import "package:worldtime/main.dart";

import 'pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Home(),
      initialRoute: '/home',
      routes: {

        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => ChooseLocation(),
      },
    ),
  );
}
