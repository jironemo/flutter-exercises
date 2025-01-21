import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(const AppBarDemo());
}
class AppBarDemo extends StatelessWidget{
  const AppBarDemo({super.key});
  Widget showImage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQayOQRAIdgUISylLp-srtcLkRmbo1OYZsZ3Q&s',
                height:300,
                width:300
            ),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQayOQRAIdgUISylLp-srtcLkRmbo1OYZsZ3Q&s',
              height:300,
              width:300
            ),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQayOQRAIdgUISylLp-srtcLkRmbo1OYZsZ3Q&s'
            )
          ],
        )
      ]
    );
  }

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
            body:  Container(
              color: Colors.green,
            padding: EdgeInsets.all(20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                showImage(),
              ],

            ))
        )

    );
  }

}