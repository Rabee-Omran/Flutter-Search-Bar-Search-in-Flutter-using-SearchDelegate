import 'package:flutter/material.dart';
import 'package:search_delegate_tutorial/single_student_widget.dart';

import 'students_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search Demo"),
          actions: [
            IconButton(
              onPressed: () async {
                showSearch<Student?>(
                    context: context, delegate: StudentSearchDelegate());
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: studentsData.length,
            itemBuilder: (context, index) {
              return SingleStudentWidget(
                student: studentsData[index],
              );
            }));
  }
}

class StudentSearchDelegate extends SearchDelegate<Student?> {
  @override
  String get searchFieldLabel => "Search For Student";
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
        hintColor: Colors.white,
        inputDecorationTheme:
            const InputDecorationTheme(border: InputBorder.none),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          // Navigator.of(context).pop();
          close(context, null);
        },
        icon: const Icon(Icons.navigate_before));
  }

  @override
  Widget buildResults(BuildContext context) {
    final listItems = query.isEmpty
        ? studentsData
        : studentsData
            .where((student) =>
                student.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return listItems.isEmpty
        ? const Center(
            child: Text("No Data Found !"),
          )
        : ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return SingleStudentWidget(
                student: listItems[index],
              );
            });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return InkWell(
      onTap: () {
        showResults(context);
      },
      child: const Center(
        child: Text(
          "Start Searching",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
