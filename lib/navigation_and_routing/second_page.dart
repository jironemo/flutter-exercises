import 'package:demo_app/navigation_and_routing/reusable_bottom_appbar.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/third'),
              child: const Text("Go to Third Page!"))),
      bottomNavigationBar: const ReusableBottomAppBar(),
    );
  }
}
