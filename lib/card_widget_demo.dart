import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            body: Column(
          children: [
            Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Smith"),
                        SizedBox(width: 5),
                        Text("ME-2024-2025")
                      ],
                    ))),
            Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Smith"),
                        SizedBox(width: 5),
                        Text("ME-2024-2025")
                      ],
                    )))
          ],
        )));
  }
}
