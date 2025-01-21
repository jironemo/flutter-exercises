import 'package:demo_app/navigation_and_routing/reusable_bottom_appbar.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/first', (route) => false),
              child: const Text("Back to First Page"))),
      bottomNavigationBar: ReusableBottomAppBar(),
    );
  }
}
