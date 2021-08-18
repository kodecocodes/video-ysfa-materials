import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'courses_controller.dart';
import '../../model/course.dart';
import '../../repository/course_repository.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          final courses = snapshot.data;
          if (courses == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Text(courses.toString());
        });
  }
}
