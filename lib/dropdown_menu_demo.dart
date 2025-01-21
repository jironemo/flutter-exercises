import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? selectedItem;
    List<String> items = ['Red', 'Green', 'Blue'];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: Center(
              // child: DropdownMenu<String>(
              //   initialSelection: selectedColor,
              //   onSelected: ( String? value) {
              //     setState(() {
              //       selectedColor = value;
              //     });
              //   },
              //   dropdownMenuEntries: const <DropdownMenuEntry<String>>[
              //     DropdownMenuEntry(value: 'Red', label: 'Red'),
              //     DropdownMenuEntry(value: 'Green', label: 'Green'),
              //     DropdownMenuEntry(value: 'Blue', label: 'Blue'),
              //   ],
              //   textStyle: TextStyle(fontSize: 16, color: Colors.black),
              //   width: 200,
              //   enableFilter: true,
              // )
              child: DropdownMenu<String>(
        initialSelection: selectedItem,
        onSelected: (newValue) {
          setState(() {
            selectedItem = newValue;
          });
        },
        dropdownMenuEntries: items.map((String item) {
          return DropdownMenuEntry<String>(
            value: item,
            label: item,
          );
        }).toList(),
        enableFilter: true,
      ))),
    );
  }
}
