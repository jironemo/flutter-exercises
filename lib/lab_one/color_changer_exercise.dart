import 'package:flutter/material.dart';

void main() {
  runApp(const ColorChanger());
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ColorChangerState();
  }
}

class _ColorChangerState extends State<ColorChanger> {
  MaterialColor backgroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              color: backgroundColor,
              child: const Center(child: Text("Background")),
            )),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(width: 60, height: 60, color: Colors.yellow),
                  onTap: () => setState(() {
                    backgroundColor = Colors.yellow;
                  }),
                ),
                GestureDetector(
                  child: Container(width: 60, height: 60, color: Colors.orange),
                  onTap: () => setState(() {
                    backgroundColor = Colors.orange;
                  }),
                ),
                GestureDetector(
                    child:
                        Container(width: 60, height: 60, color: Colors.green),
                    onTap: () => setState(() {
                          backgroundColor = Colors.green;
                        })),
                GestureDetector(
                    child: Container(width: 60, height: 60, color: Colors.red),
                    onTap: () => setState(() {
                          backgroundColor = Colors.red;
                        })),
              ],
            ))
      ],
    )));
  }
}
