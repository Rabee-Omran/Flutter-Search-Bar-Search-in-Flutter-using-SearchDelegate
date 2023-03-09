import 'package:flutter/material.dart';
import 'package:search_delegate_tutorial/student_details_page.dart';
import 'package:search_delegate_tutorial/students_data.dart';

class SingleStudentWidget extends StatelessWidget {
  final Student student;
  const SingleStudentWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.00, right: 15.00),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => StudentDetailsPage(student: student)));
          },
          leading: const Icon(
            Icons.person,
            size: 40,
          ),
          title: Text(
            student.name,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          subtitle: Text(
            "Student ID : ${(student.id.toString())}",
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ));
  }
}
