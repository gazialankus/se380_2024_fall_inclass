
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se380_wk1/student.dart';

void main() {
  runApp(ClassroomApp());
}

class ClassroomApp extends StatelessWidget {
  const ClassroomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClassroomPage(),
    );
  }
}


class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final students = <Student>[];

  @override
  void initState() {
    super.initState();
    students.addAll([
      Student('Ali Yilmaz', 19),
      Student('Veli Kaya', 20),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (final student in students)
              StudentWidget(
                student: student,
                onStudentChanged: () {
                  setState(() {});
                }
              ),
          ],
        ),
      ),
    );
  }
}

class StudentWidget extends StatelessWidget {
  const StudentWidget({
    super.key,
    required this.student, required this.onStudentChanged,
  });

  final Student student;
  final void Function() onStudentChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        student.name,
        textScaler: TextScaler.linear(2),
      ),
      subtitle: Text(
        'Age: ${student.age}',
        textScaler: TextScaler.linear(1.5),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              print('will decrease age ${student.name} here');
              student.age -= 1;
              onStudentChanged();
            },
            icon: Icon(Icons.exposure_minus_1),
          ),
          IconButton(
            onPressed: () {
              print('will increase age of ${student.name} here');
              student.age += 1;
              onStudentChanged();
            },
            icon: Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}


