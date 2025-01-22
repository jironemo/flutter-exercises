import 'package:flutter/material.dart';

void main() {
  runApp(const MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: GestureDetector(
                onTap: () => setState(() {
                      count++;
                    }),
                child: Center(
                    child: Text(
                  "You tapped $count times",
                  style: const TextStyle(fontSize: 40),
                )))));
  }
}
