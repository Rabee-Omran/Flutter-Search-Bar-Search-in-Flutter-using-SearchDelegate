import 'package:flutter/material.dart';
import 'package:search_delegate_tutorial/students_data.dart';

class StudentDetailsPage extends StatelessWidget {
  final Student student;
  const StudentDetailsPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              student.name.toString(),
              style: const TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 20),
            Text(
              "Student ID : ${student.id}",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
