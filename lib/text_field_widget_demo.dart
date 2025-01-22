import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldWidgetDemo());
}

class TextFieldWidgetDemo extends StatefulWidget {
  const TextFieldWidgetDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextFieldWidgetDemoState();
  }
}

class _TextFieldWidgetDemoState extends State<TextFieldWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "User Name",
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Address",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    prefixIcon: const Icon(Icons.email),
                    suffixIcon: const Icon(Icons.verified),
                    filled: true,
                    fillColor: Colors.lightGreenAccent.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          )),
    ));
  }
}
