import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset('images/start.png'),
          TextButton(
            child: const Text("Start"),
            onPressed: () => Navigator.pushNamed(context, "/booking"),
          )
        ],
      ),
    ));
  }
}
