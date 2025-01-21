import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Student(
        srno: 10001,
        sname: 'Smith',
        email: 'smith@example.com',
        address: '123 Main Street, London');
    return Scaffold(
        appBar: AppBar(title: const Text("Home Screen")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(student: student)),
                  );
                },
                child: const Text('View student details'))));
  }
}

class DetailsScreen extends StatelessWidget {
  final Student student;

  const DetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Details Screen')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Roll Number: ${student.srno}"),
            Text("Name: ${student.sname}"),
            Text("Email: ${student.email}"),
            Text("Address: ${student.address}"),
          ],
        )));
  }
}

class Student {
  final int srno;
  final String sname;
  final String email;
  final String address;

  Student(
      {required this.email,
      required this.sname,
      required this.srno,
      required this.address});
}
