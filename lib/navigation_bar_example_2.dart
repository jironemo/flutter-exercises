import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.home,
          size: 150,
          color: Colors.blueGrey,
        ),
        Text(
          "Welcome to the home screen!",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search, size: 150, color: Colors.orange),
        Text(
          "Search for anything!",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.settings, size: 150, color: Colors.lightBlue),
        Text(
          "Adjust your preferences here!",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('NavigationBar Example'),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => setState(() {
                _currentIndex = index;
              }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
          ]),
    ));
  }
}
