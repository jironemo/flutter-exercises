import 'package:demo_app/navigation_and_routing/reusable_bottom_appbar.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/second"),
              child: const Text("Go To Second Page!"))),
      bottomNavigationBar: const ReusableBottomAppBar(),
    );
  }
}
