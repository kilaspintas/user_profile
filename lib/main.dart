import 'package:flutter/material.dart';

import 'profile_ui.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
  ),
  home: MyApp(),
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ProfileUI(),
    );
  }
}
