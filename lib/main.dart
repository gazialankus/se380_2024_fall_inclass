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
            if (widget._counter % 5 != 0) TitlePart('first ${widget._counter}'),
            if (widget._counter % 5 != 0) TitlePart('second ${widget._counter}'),
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
