import 'package:flutter/material.dart';
import 'package:se380_wk1/multi_child_app.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MultiChildPage(),
    );
  }
}

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: SizedBox(
          height: 200,
          width: 200,
          child: ColoredBox(
            color: Colors.pink,
            child: Center(
              child: SizedBoxAndBelow('one'),
            ),
          ),
        ),
      ),
    );
  }
}

class SizedBoxAndBelow extends StatelessWidget {
  const SizedBoxAndBelow(this.s, {
    super.key,
  });

  final String s;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Center(
        child: ColoredBox(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: SizedBox(
              width: 50,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Colors.red,
                  ),
                ),
                child: Text(
                  s,
                  // textAlign: TextAlign.right,
                  textScaler: TextScaler.linear(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
