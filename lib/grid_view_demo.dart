import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewDemo());
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 3,
        children: List.generate(100, (index) {
          return Container(
              height: 2,
              width: 10,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text('Item $index',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))));
        }),
      ),
    ));
  }
}
