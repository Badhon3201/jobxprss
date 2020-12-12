import 'package:flutter/material.dart';
import 'package:jobxpress/screens/splashScreen.dart';

import 'login_page.dart';

void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => LoginPage(),
  //"/intro": (BuildContext context) => IntroScreen(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: publisherList(),
      home: SplashScreen(),
      routes: routes,
    );
  }
}

