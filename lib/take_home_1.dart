import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(AppBarDemo());
}

class AppBarDemo extends StatelessWidget {
  AppBarDemo({super.key});

  List<Widget> card_list = List.filled(
      3,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQayOQRAIdgUISylLp-srtcLkRmbo1OYZsZ3Q&s',
              height: 150,
              width: 150),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List<Widget>.filled(5,Icon(Icons.star, color: Colors.yellow)),
              ),
              const Text(
                "Make It Merry Tree",
              ),
              const Text(
                "\$30 SALE",
              ),
              const Text(
                "SAME DAY DELIVERY",
              )
            ],
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromRGBO(87, 161, 87, 1.0),
                foregroundColor: Colors.white,
                title: const Text("Take Home Assignment 1"),
                leading: const Icon(FontAwesomeIcons.facebook)),
            body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: card_list,
                ))
    ));
  }
}
