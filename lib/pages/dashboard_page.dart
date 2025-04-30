import 'package:flutter/material.dart';
import 'package:study_planner/pages/course_page.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  final List<Map<String, String>> courses = [
    {
      'title': 'Mathematics',
      'content': 'Mathematics reading material: Algebra, Calculus, Geometry...',
    },
    {
      'title': 'Physics',
      'content': 'Physics reading material: Mechanics, Thermodynamics, Optics...',
    },
    {
      'title': 'Chemistry',
      'content': 'Chemistry reading material: Organic, Inorganic, Physical Chemistry...',
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
