import 'package:flutter/material.dart';
import 'package:httpsample/view/people_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HTTP Sample App",
      home: PeopleView(),
    );
  }
}
