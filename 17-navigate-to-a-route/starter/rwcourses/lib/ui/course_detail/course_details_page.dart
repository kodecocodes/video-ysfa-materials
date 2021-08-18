import 'package:flutter/material.dart';
import '../../model/course.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.name)),
      body: const Text('Course Details'),
    );
  }
}
