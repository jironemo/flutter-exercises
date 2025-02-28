import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: GameApp()));
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameAppState createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  int face = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Game"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("images/dice_$face.png", width: 200, height: 200),
          Text(
            "$face",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              int k = Random().nextInt(6) + 1;
              setState(() => face = k);
            },
            child: const Text("Play"),
          )
        ],
      )),
    );
  }
}
