import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const List<Map<String, String>> profiles = [
    {
      'name': 'Aung Khaing Khant',
      'rno': '2024-MECS-006',
      'bio': 'MECS Student'
    },
    {
      'name': 'Aung Khaing Khant',
      'rno': '2024-MECS-006',
      'bio': 'MECS Student'
    },
    {
      'name': 'Aung Khaing Khant',
      'rno': '2024-MECS-006',
      'bio': 'MECS Student'
    },
    {
      'name': 'Aung Khaing Khant',
      'rno': '2024-MECS-006',
      'bio': 'MECS Student'
    },
    {
      'name': 'Aung Khaing Khant',
      'rno': '2024-MECS-006',
      'bio': 'MECS Student'
    },
    {'name': 'Aung Khaing Khant', 'rno': '2024-MECS-006', 'bio': 'MECS Student'}
  ];

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
          appBar: AppBar(
            leading: const FlutterLogo(),
            title: const Text("Profile App Demo"),
          ),
          body: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(children: [
                          ClipOval(
                            child: Image.network(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(profile['name']!),
                                Text(profile['rno']!),
                                Text(profile['bio']!),
                              ],
                            ),
                          )
                        ])));
              })),
    );
  }
}
