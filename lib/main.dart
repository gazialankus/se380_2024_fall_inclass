import 'package:flutter/material.dart';

void main() {
  int i = 10;

  runAForLoop(i);

  print("hello world");
  runApp(new MyApp());
}

void runAForLoop(int i) {
  for (int j = 0; j < 5; ++j) {
    print(i);
    print(j);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    print('I am in the constructor');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo during class',
      theme: new ThemeData(
        colorScheme: new ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
            new Text(
              'You have pressed this many times',
            ),
            new Text(
              '${widget._counter} is the current number!!!!!!',
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
