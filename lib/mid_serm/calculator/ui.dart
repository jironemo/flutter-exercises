import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main() {
  runApp(const MaterialApp(home: CalculatorUI()));
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String calculationStr = "";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Calculator"),
            leading: const Icon(FontAwesomeIcons.burger)),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blueAccent),
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(calculationStr,
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.right),
                )),
            Expanded(
                flex: 5,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 4,
                      children: _populateButtons(),
                    )))
          ],
        ));
  }

  void addToScreen(int num) {
    setState(() => calculationStr += num.toString());
  }

  List<Widget> _populateButtons() {
    List<TextButton> buttons = List.generate(9, (index) {
      return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: const ContinuousRectangleBorder(
                side: BorderSide(width: 2, color: Colors.blueGrey))),
        onPressed: () {
          addToScreen(index + 1);
        },
        child: Text(
          "${index + 1}",
          style: const TextStyle(fontSize: 20),
        ),
      );
    }).reversed.toList();

    buttons += [
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => setState(
                () => calculationStr = "",
              ),
          child: const Text(
            "C",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => addToScreen(0),
          child: const Text(
            "0",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => calculateAnswer(),
          child: const Text(
            "=",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => setState(() {
                calculationStr += "+";
                operator = "+";
              }),
          child: const Text(
            "+",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => setState(() {
                calculationStr += "-";
                operator = "-";
              }),
          child: const Text(
            "-",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => setState(() {
                calculationStr += "*";
                operator = "*";
              }),
          child: const Text(
            "*",
            style: TextStyle(fontSize: 20),
          )),
      TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const ContinuousRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.blueGrey))),
          onPressed: () => setState(() {
                calculationStr += "/";
                operator = "/";
              }),
          child: const Text(
            "/",
            style: TextStyle(fontSize: 20),
          )),
    ];
    return buttons;
  }

  void calculateAnswer() {
    var [firstOp, secondOp] = calculationStr.split(operator);
    double firstOpDou = double.parse(firstOp);
    double secondOpDou = double.parse(secondOp);
    setState(() {
      switch (operator) {
        case "+":
          calculationStr += ("=${firstOpDou + secondOpDou}");
        case "-":
          calculationStr += ("=${firstOpDou - secondOpDou}");
        case "/":
          calculationStr += ("=${firstOpDou / secondOpDou}");
        case "*":
          calculationStr += ("=${firstOpDou * secondOpDou}");
      }
    });
  }
}
