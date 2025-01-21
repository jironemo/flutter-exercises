import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonWidgetDemo2());
}

class ButtonWidgetDemo2 extends StatefulWidget {
  const ButtonWidgetDemo2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgetDemo2State();
  }
}

class _ButtonWidgetDemo2State extends State<ButtonWidgetDemo2> {
  int _randomNumber = 0;

  void _generateRandomNumber() {
    setState(() {
      Random r = Random();

      _randomNumber = r.nextInt(100) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Random Nummber Generator"),
            backgroundColor: Colors.grey,
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Generated Number:"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$_randomNumber",
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _generateRandomNumber,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 30,
                  ),
                  child: const Text("Create Random Number"))
            ]),
          )),
    );
  }
}
