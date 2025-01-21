import 'package:flutter/material.dart';

void main() {
  runApp(const FormWidgetDemo());
}

class FormWidgetDemo extends StatefulWidget {
  const FormWidgetDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormWidgetDemoState();
  }
}

class _FormWidgetDemoState extends State<FormWidgetDemo> {
  String email = "";
  String username = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
          padding: const EdgeInsets.all(100),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter username",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = _emailController.text;
                        username = _usernameController.text;
                      });
                    }
                  },
                  child: const Text('Submit')),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(children: [
                    const Text("Your e-mail address is:"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                          color: Color.fromRGBO(15, 15, 176, 1.0),
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("Your username is:"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                            color: Color.fromRGBO(15, 15, 176, 1.0),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ]),
          )),
    ));
  }
}
