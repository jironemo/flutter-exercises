import 'package:flutter/material.dart';

void main() {
  runApp(const StackDemo());
}


class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:Stack(children: [
            Positioned(
                child: Image.asset(
                  "images/preview.jpg",
                  height: 2000,
                  width: 2000,
                  fit: BoxFit.fill,
                )),
            Positioned(
                child: Center(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxpwXXO-V3KfOyFAaK1w23Z9lASQb5T1n6hw&s",
                    ))),
            const Positioned(
                left:0,
                right:0,
                top:10,
                child: Text(
                  "Happy Holiday!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:45,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(
                      color: Colors.lightGreenAccent,
                      offset: Offset(2, 3),
                      blurRadius: 2
                    )]
                  )
                )),
            const Positioned(
              left:5,
              bottom:5,
              child: Text(
                "From, Aung Khaing Khant",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                )
              )
            )
          ])
        ));
  }
}
