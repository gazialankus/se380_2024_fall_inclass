
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  final students = <ValueNotifier<Student>>[];

  @override
  void initState() {
    super.initState();
    students.addAll([
      ValueNotifier(Student('Ali Yilmaz', 19)),
      ValueNotifier(Student('Veli Kaya', 20)),
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
              ),
            Spacer(),
            ValueListenableBuilder(valueListenable: students[0], builder: (context, value0, child) {
              return ValueListenableBuilder(valueListenable: students[1], builder: (context, value1, child) {
                final elder = value0.age > value1.age ? value0: value1;
                return Text('Elder is ${elder.name}', textScaler: TextScaler.linear(2),);
              },);
            },),
            Text('Oldest is '),
            Spacer(),
            for (final student in students)
              StudentWidget(
                student: student,
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
    required this.student,
  });

  final ValueNotifier<Student> student;

  @override
  Widget build(BuildContext context) {
    return InheritedStudentNotifier(
      notifier: student,
      child: ListTile(
        title: StudentNameWidget(),
        subtitle: StudentAgeWidget(),
        trailing: StudentAgeChanger(),
      ),
    );
  }
}

class StudentAgeChanger extends StatelessWidget {
  const StudentAgeChanger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final student = InheritedStudentNotifier.maybeOf(context);

    if (student != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              print('will decrease age ${student.name} here');
              InheritedStudentNotifier.maybeNotifier(context)?.value = student.copyWith(age: student.age - 1);
            },
            icon: Icon(Icons.exposure_minus_1),
          ),
          IconButton(
            onPressed: () {
              print('will increase age of ${student.name} here');
              InheritedStudentNotifier.maybeNotifier(context)?.value = student.copyWith(age: student.age + 1);
            },
            icon: Icon(Icons.plus_one),
          ),
        ],
      );
    }
    return SizedBox.shrink();


  }
}

class StudentAgeWidget extends StatelessWidget {
  const StudentAgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final student = InheritedStudentNotifier.maybeOf(context);

    if (student != null) {
      return Text(
        'Age: ${student.age}',
        textScaler: TextScaler.linear(1.5),
      );
    }
    return SizedBox.shrink();
  }
}

class StudentNameWidget extends StatelessWidget {
  const StudentNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final student = InheritedStudentNotifier.maybeOf(context);

    if (student != null) {
      return Text(
        student.name,
        textScaler: TextScaler.linear(2),
      );
    }
    return SizedBox.shrink();
  }
}

// class InheritedStudent extends InheritedWidget {
//   const InheritedStudent({
//     super.key,
//     required super.child,
//     required this.student,
//   });
//
//   final ValueNotifier<Student> student;
//
//   static InheritedStudent? maybeOf(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<InheritedStudent>();
//   }
//
//   @override
//   bool updateShouldNotify(InheritedStudent old) {
//     return student.value.name != old.student.value.name ||
//         student.value.age != old.student.value.age;
//   }
// }

class InheritedStudentNotifier extends InheritedNotifier<ValueListenable<Student>> {
  const InheritedStudentNotifier({
    super.key,
    super.notifier,
    required super.child,
  });

  static Student? maybeOf(BuildContext context) {
    final inheritedStudentNotifier = context.dependOnInheritedWidgetOfExactType<InheritedStudentNotifier>();
    return inheritedStudentNotifier?.notifier?.value;
  }
  static ValueNotifier<Student>? maybeNotifier(BuildContext context) {
    final inheritedStudentNotifier = context.dependOnInheritedWidgetOfExactType<InheritedStudentNotifier>();
    final l = inheritedStudentNotifier?.notifier;
    if (l is ValueNotifier<Student>) {
      return l;
    } else {
      return null;
    }
  }
}