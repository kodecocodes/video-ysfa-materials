import '../model/course.dart';

abstract class Repository {
  Future<List<Course>> getCourses(int domainFilter);
}
