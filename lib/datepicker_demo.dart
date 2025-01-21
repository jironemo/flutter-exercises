import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(const MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DatePickerDemoState();
  }
}

class _DatePickerDemoState extends State<MyApp>{
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(picked != null && _dateController.text != DateFormat('dd-MM-yyyy').format(picked)){
      setState((){
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.bug),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Date Picker Demo"),
      ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child:
              TextField(
                readOnly: true,
                decoration: const InputDecoration(
                    label: Text("Select Date"),
                    prefixIcon: Icon(
                    FontAwesomeIcons.calendarDay
                  )
                ),
                controller: _dateController,
                onTap: () => _selectDate(context),
              )
          ),
      );
  }


}