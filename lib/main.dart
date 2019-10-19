import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'SigninPage.dart';
import 'SignupPage.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Automation login',
      
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "SigninPage": (BuildContext context) => SigninPage(),
        "/SignupPage": (BuildContext context) => SignupPage(),

        //"/SignupPage": (BuildContext context) => SignupPage(),
      },
    );
  }
}
