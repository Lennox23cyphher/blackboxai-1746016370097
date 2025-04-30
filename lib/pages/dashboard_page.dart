import 'package:flutter/material.dart';
import 'package:study_planner/pages/course_page.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  final List<Map<String, String>> courses = [
    {
      'title': 'Linear Algebra',
      'content': 'Linear Algebra reading material: Vector spaces, Matrices, Eigenvalues...',
    },
    {
      'title': 'Mobile App Development',
      'content': 'Mobile App Development reading material: Flutter, Dart, UI design, State management...',
    },
    {
      'title': 'Calculus',
      'content': 'Calculus reading material: Limits, Derivatives, Integrals, Series...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - Welcome $username'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          var course = courses[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(course['title']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoursePage(
                      courseTitle: course['title']!,
                      courseContent: course['content']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
