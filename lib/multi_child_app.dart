import 'package:flutter/material.dart';

class MultiChildPage extends StatelessWidget {
  const MultiChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TITLE'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'row1',
                  textScaler: TextScaler.linear(5),
                ),
                Text(
                  'row1',
                  textScaler: TextScaler.linear(5),
                ),
                Text(
                  'row1',
                  textScaler: TextScaler.linear(5),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Text(
                'row1',
                textScaler: TextScaler.linear(5),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'row1',
                textScaler: TextScaler.linear(5),
              ),
            ),
            Text(
              'row1',
              textScaler: TextScaler.linear(5),
            ),
          ],
        ),
      ),
    );
  }
}
