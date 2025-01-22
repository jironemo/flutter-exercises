import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerDemo());
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Container Layout Demo"),
              backgroundColor: Colors.black26,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: const Text("Hello, World!"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 10)),
                  alignment: Alignment.center,
                  child: const Text("Hello"),
                )
              ],
            ))));
  }
}
