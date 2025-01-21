import 'package:demo_app/navigation_and_routing/first_page.dart';
import 'package:demo_app/navigation_and_routing/third_page.dart';
import 'package:flutter/material.dart';

import 'second_page.dart';

void main() {
  runApp(const NavigationExample());
}

class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData.dark(),
      initialRoute: '/first',
      routes: {
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third':(context) => const ThirdPage(),
      },
    );
  }
}
