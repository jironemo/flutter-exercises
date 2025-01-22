import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static final dio = Dio();
  Future roomsFuture = request();

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
          body: Center(
        child: FutureBuilder(
            future: roomsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final rooms = snapshot.data;
                return buildRooms(rooms);
              } else {
                return const Text("No data available");
              }
            }),
      )),
    );
  }

  Widget buildRooms(List<Room> rooms) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        final room = rooms[index];
        return Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black38)),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(children: [
                    Text(room.roomNo),
                    Text(room.roomType?.typeName as String)
                  ]),
                )));
      },
    );
  }

  static Future<List<Room>> request() async {
    final response = await dio.get('http://localhost:8080/room/');
    return (response.data as List)
        .map((roomJson) => Room.fromJson(roomJson))
        .toList();
  }
}

class Room {
  int id = 0;
  String roomNo = "";
  RoomType? roomType;

  Room({required this.id, required this.roomNo, this.roomType});

  factory Room.empty() {
    return Room(id: 0, roomNo: "");
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
        id: json['id'],
        roomNo: json['room_no'],
        roomType: RoomType.fromJson(json['roomType']));
  }
}

class RoomType {
  int id = 0;
  String typeName = "";
  double price = 0;
  String amneties = "";

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
        id: json['id'],
        typeName: json['typeName'],
        price: json['price'],
        amneties: json['amneties']);
  }

  RoomType(
      {required this.id,
      required this.typeName,
      required this.price,
      required this.amneties});
}

class RoomStatus {
  int roomStatusId = 0;
  String status = "";
  String description = "";

  RoomStatus(
      {required this.roomStatusId,
      required this.description,
      required this.status});
}
