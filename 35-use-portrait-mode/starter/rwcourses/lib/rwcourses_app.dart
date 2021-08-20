import 'package:flutter/material.dart';
import 'strings.dart';
import 'ui/courses/courses_page.dart';
import 'ui/filter/filter_page.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Navigator.of(context).push<MaterialPageRoute>(
              MaterialPageRoute(builder: (_) => const FilterPage()),
            ),
          )
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
