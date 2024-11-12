import 'package:flutter/material.dart';
import 'package:se380_wk1/layout_app.dart';

class Person {
  Person(this.name);

  final String name;
}

void myF(Person? p) {
  Person px;

  px = Person('a');

  px.name;

  final a = p?.name;

  if (p != null) {
    final n = p.name;
  }
}

void main() {
  Person? a;

  myF(a);
  runApp(const LayoutApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo during class',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required String title}) : this.title = title;

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Classroom(5),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.accessible_outlined),
      ),
    );
  }
}

class MessageArea extends StatefulWidget {
  const MessageArea({
    required this.data,
  });

  final String data; // props

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {
  late Person p; // state

  @override
  void initState() {
    super.initState();
    p = Person(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      p.name,
    );
  }
}


class Classroom extends StatefulWidget {
  const Classroom(this.desiredStudentCount);

  final int desiredStudentCount;

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  late final int initialStudentCount;
  final students = <Person>[];

  @override
  void initState() {
    super.initState();
    initialStudentCount = widget.desiredStudentCount;
    for (int i = 0; i < initialStudentCount; ++i) {
      students.add(Person('student $i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < students.length; ++i)
          PersonView(theStudent: students[i]),
        ElevatedButton(
          onPressed: () {
            setState(() {
              students.add(Person('new person ${students.length}'));
            });
          },
          child: Text('Add new student'),
        ),
      ],
    );
  }
}

class PersonView extends StatelessWidget {
  const PersonView({
    super.key,
    required this.theStudent,
  });

  final Person theStudent;


  @override
  Widget build(BuildContext context) {
    return Text(theStudent.name, style: TextStyle(fontSize: 34));
  }
}
