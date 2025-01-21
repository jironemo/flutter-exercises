import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(const AppBarDemo());
}
class AppBarDemo extends StatelessWidget{
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color.fromRGBO(87, 161, 87, 1.0),
              foregroundColor: Colors.white,
              title: const Text("App Bar Demo"),
            leading: const Icon(FontAwesomeIcons.facebook)
          ),
        body: Center(
          ///Image from network/ with url
          // child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQayOQRAIdgUISylLp-srtcLkRmbo1OYZsZ3Q&s'),
          ///Image from assets
          //   child: Image.asset('images/test.png')
          // Icon
          child: Icon(
            Icons.person,
            size:200,
          )

        )
      )

    );
  }

}