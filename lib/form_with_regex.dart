import 'package:flutter/material.dart';

void main() {
  runApp(const FormWidgetRegex());
}

class FormWidgetRegex extends StatefulWidget {
  const FormWidgetRegex({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormWithRegexState();
  }
}

class _FormWithRegexState extends State<FormWidgetRegex> {
  String email = "";
  String username = "";
  String phonenumber = "";
  String message = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          body: Padding(
              padding: EdgeInsets.all(100),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter email",
                      ),
                      validator: (value) {
                        RegExp emailExp = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!emailExp.hasMatch(value)) {
                          return 'Please enter a valid Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Phone Number",
                      ),
                      validator: (value) {
                        RegExp emailExp = RegExp(r'^09[0-9]{9}$');
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone number";
                        } else if (!emailExp.hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if(_formKey.currentState!.validate()) {
                                message = "Registration Successful!";
                            }else{
                                message = "";
                            }
                          });
                        },
                        child: const Text('Submit')),
                    const SizedBox(height: 30),
                    Text(
                      message,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(41, 148, 12, 1.0)
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
