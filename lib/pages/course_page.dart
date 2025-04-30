import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final String courseTitle;
  final String courseContent;

  CoursePage({required this.courseTitle, required this.courseContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          courseContent,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
