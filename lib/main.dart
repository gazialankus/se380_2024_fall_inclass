import 'package:flutter/material.dart';

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
  runApp(const MyApp());
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // MessageArea(data: 'You have pressed this many times: $_counter'),
            Classroom(5),
            // Text(
            //   '$_counter is the current number',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
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
  late int initialStudentCount;

  @override
  void initState() {
    super.initState();
    initialStudentCount = widget.desiredStudentCount;
  }

  @override
  Widget build(BuildContext context) {
    return Text('initial count: $initialStudentCount', style: TextStyle(fontSize: 34),);
  }
}
