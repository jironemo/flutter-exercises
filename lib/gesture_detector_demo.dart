// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const GestureDetectorDemo());
}

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: GestureDetector(
                    onTap: () {
                      print("Widget tapped");
                    },
                    onDoubleTap: () {
                      print("Widget double-tapped");
                    },
                    onLongPress: () {
                      print("Widget long pressed");
                    },
                    onPanUpdate: (details) {
                      print("Dragged:${details.delta}");
                    },
                    child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text(
                          "Tap Me",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))))));
  }
}
