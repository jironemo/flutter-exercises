import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AssignmentIIIUi()));
}

class AssignmentIIIUi extends StatefulWidget {
  const AssignmentIIIUi({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AssignmentIIIUiState();
  }
}

String? emailValidator(value) {
  RegExp emailExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');
  if (value == null || value.isEmpty) {
    return "Please enter your email";
  } else if (!emailExp.hasMatch(value)) {
    return 'Please enter a valid Email';
  } else {
    return null;
  }
}

String? usernameValidator(value) {
  if (value == null || value.isEmpty) {
    return "Please enter your name";
  } else {
    return null;
  }
}

String? phonenumberValidator(value) {
  RegExp emailExp = RegExp(r'^09[0-9]{9}$');
  if (value == null || value.isEmpty) {
    return "Please enter your phone number";
  } else if (!emailExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  } else {
    return null;
  }
}

class _AssignmentIIIUiState extends State<AssignmentIIIUi> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String username = "";
  String phonenumber = "";
  String _selectedMajor = "";
  String _majorErrorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.circleCheck)),
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.user)),
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                      ),
                      validator: (value) => usernameValidator(value),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.circleCheck)),
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.at)),
                        border: OutlineInputBorder(),
                        hintText: "Enter email",
                      ),
                      validator: (value) => emailValidator(value)
                      ,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.circleCheck)),
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(FontAwesomeIcons.phone)),
                        border: OutlineInputBorder(),
                        hintText: "Enter Phone Number",
                      ),
                      validator: (value) => phonenumberValidator(value)
                    ),
                    const SizedBox(height: 30),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Choose A Major",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        RadioListTile<String>(
                          contentPadding: const EdgeInsets.all(0.5),
                          title: const Text("CSE"),
                          value: "CSE",
                          groupValue: _selectedMajor,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedMajor = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
                        RadioListTile<String>(
                          contentPadding: const EdgeInsets.all(0.5),
                          title: const Text("ECE"),
                          value: "ECE",
                          groupValue: _selectedMajor,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedMajor = value!;
                            });
                          },
                        ),
                        Text(
                          _majorErrorMessage,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    )),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_selectedMajor.isEmpty ||
                              _selectedMajor == null) {
                            setState(() {
                              _majorErrorMessage = "Please select a major.";
                            });
                          }
                          if (_formKey.currentState!.validate() &&
                              _selectedMajor != null &&
                              _selectedMajor.isNotEmpty) {
                            setState(() {
                              email = _emailController.text;
                              username = _usernameController.text;
                              phonenumber = _phoneNumberController.text;
                              _majorErrorMessage = "";
                            });
                            showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                      title: const Text(
                                          "Registration Information"),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 0,
                                              bottom: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Name: $username"),
                                              Text("Email: $email"),
                                              Text("Phone No: $phonenumber"),
                                              Text("Major: $_selectedMajor")
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                          }
                        },
                        child: const Text('Submit')),
                  ],
                ))));
  }
}
