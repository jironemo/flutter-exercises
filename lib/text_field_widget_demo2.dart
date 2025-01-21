import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldWidgetDemo());
}

class TextFieldWidgetDemo extends StatefulWidget {
  const TextFieldWidgetDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextFieldWidgetDemoState();
  }
}

class _TextFieldWidgetDemoState extends State<TextFieldWidgetDemo> {
  String str = "";
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Type Item",
                ),
                onSubmitted: (value) {
                  setState(() {
                    str = _textEditingController.text;
                    _textEditingController.clear();
                  });
                },
              ),
              Text(str)
            ],
          )),
    ));
  }
}
