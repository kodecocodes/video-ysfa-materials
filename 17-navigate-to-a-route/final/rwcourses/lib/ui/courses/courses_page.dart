import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/ui/course_detail/course_details_page.dart';
import 'courses_controller.dart';
import '../../model/course.dart';
import '../../repository/course_repository.dart';
import '../course_detail/course_details_page.dart';

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
          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int position) {
                return _buildRow(courses[position]);
              });
        });
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(course.name, style: const TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(course.domainString),
        onTap: () {
          Navigator.of(context).push<MaterialPageRoute>(
            MaterialPageRoute(
              builder: (context) => CourseDetailsPage(
                course: course,
              ),
            ),
          );
        },
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            course.artworkUrl,
          ),
        ),
      ),
    );
  }
}
