import 'dart:convert';

import 'package:flutter/material.dart';

class Person {
  // Person(int age) : age = age {
  //   print('a');
  // }
  Person({required this.age}) : _numberOfSecrets = age ~/ 2 {
    // print('a ' + age.toString() + ' is my age');
    print('a ${age + 2} is my age');
  }

  Person.newBorn() : age = 0, _numberOfSecrets = 0;

  factory Person.factory() {
    return Person(age: 10);
  }

  int age;
  int _numberOfSecrets;
  int? numFriends;
}

String intToString(int i) {
  return '$i';
}

void main() {
  var p = Person(age: 1);
  var baby = Person.newBorn();
  var artificial = Person.factory();

  Person? maybeP;

  runHome(maybeP);

  print(p.age);
  print(p._numberOfSecrets);

  var i = 10;
  i += 1;

  final j = i;

  int k = 1 == 5 ? 6 : 7;

  final l = [
    if (i < j) 1,
    for (var k = 0; k < 4; ++k) k * 2,
    2,
    3,
  ];

  // int? firstOrNull = l.firstOrNull;

  int? firstOrNull = l.firstOrNull;

  List<String> o = l.map((i) => '$i').toList();

  final onlySmallerThan3 = l.where((i) => i < 3).toList();

  // var jj = jsonDecode('{"a": 5, "b": 6}');
  // Map<String, dynamic>

  final m = {
    if (i < j) 'a': 5,
    'b': 6,
  };

  final s = {1, 2, 3};

  print(m['a']); //5

  print(l);
  print(o);

  runAForLoop(
    5,
    3,
    myOtherVariable: 5,
  );
  runAnotherForLoop(5, 7);

  print("hello world");
  runApp(new MyApp());
}

void runHome(Person maybeP) {
  if (maybeP != null) {
    print(maybeP.age);
    final p = maybeP;

    print(p.numFriends);
  } else {

  }
}

void runAnotherForLoop(int v, [int v2 = 1]) {
  for (int j = 0; j < 5; ++j) {
    print(j);
  }
}

void runAForLoop(int v, int v2, {int myVariable = 4, int myOtherVariable = 3}) {
  for (int j = 0; j < 5; ++j) {
    print(myVariable);
    print(j);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    print('I am in the constructor');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo during class',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  int _counter = 0;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    print('increment counter was pressed!!!');

    setState(() {
      widget._counter++;
    });
    // _counter++;

  }

  @override
  Widget build(BuildContext context) {
    print('MY HOME PAGE IS RE-CREATED!!!');
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget._counter % 5 != 0) TitlePart('first ${widget._counter}'),
            if (widget._counter % 5 != 0) TitlePart('second ${widget._counter}'),
            new Text(
              '${widget._counter} is the current number!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.accessible_outlined),
      ),
    );
  }
}

class TitlePart extends StatefulWidget {
  TitlePart(String s) : myS = s {
    print(s);
  }

  String myS;


  @override
  State<TitlePart> createState() => _TitlePartState();
}

class _TitlePartState extends State<TitlePart> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('STATE IS CREATED ${widget.myS}');
  }

  @override
  void didUpdateWidget(covariant TitlePart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.myS == widget.myS) return;
    print('UPDATED. old: ${oldWidget.myS} new: ${widget.myS}');
  }

  @override
  void dispose() {
    print('DISPOSED');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text(
            '${widget.myS} Try to increment, current value is: $counter',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
