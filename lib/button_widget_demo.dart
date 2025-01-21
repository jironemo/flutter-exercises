import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonWidgetDemo());
}

class ButtonWidgetDemo extends StatefulWidget{
  const ButtonWidgetDemo({super.key});
  @override
  State<StatefulWidget> createState(){
    return _ButtonWidgetDemoState();
  }
}
class _ButtonWidgetDemoState extends State<ButtonWidgetDemo>{
  int count = 0;
  void _incrementCounter(){
    setState(() {
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Counter App"), backgroundColor: Colors.grey,),
      body: Center(
        child: Text("You have pressed this button $count times"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    ));
  }
}
