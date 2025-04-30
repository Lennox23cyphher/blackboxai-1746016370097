import 'package:flutter/material.dart';
import 'package:study_planner/pages/login_page.dart';

void main() {
  runApp(StudyPlannerApp());
}

class StudyPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
