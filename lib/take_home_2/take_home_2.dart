import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TicketBooking()));
}

class TicketBooking extends StatefulWidget {
  const TicketBooking({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TicketBookingState();
  }
}

class _TicketBookingState extends State<TicketBooking> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String fullName;
  late String phoneNumber;

  late String selectedLocation = "";
  late double selectedPrice;

  Map<String, double> priceByLocation = <String, double>{
    'Mandalay': 100,
    'Taung Gyi': 200,
    'Pyin Oo Lwin': 300,
    'Magway': 200,
    'Meiktila': 100,
    '': 0,
  };

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null &&
        _dateController.text != DateFormat('dd-MM-yyyy').format(picked)) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Ticket Booking"),

            leading: const Icon(Icons.directions_bus_sharp)),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.user),
                      hintText: "Full Name",
                      suffixIcon: Icon(FontAwesomeIcons.check),
                    ),
                    controller: _nameController,
                    validator: (name) {
                      if (name != null && name.isNotEmpty) {
                        return null;
                      } else {
                        return "Please Enter A Name";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.phone),
                      hintText: "Phone No.",
                      suffixIcon: Icon(FontAwesomeIcons.check),
                    ),
                    controller: _phoneController,
                    validator: (phoneNumber) {
                      RegExp emailExp = RegExp(r'^09[0-9]{9}$');
                      if (phoneNumber == null || phoneNumber.isEmpty) {
                        return "Please enter your phone number";
                      } else if (!emailExp.hasMatch(phoneNumber)) {
                        return 'Please enter a valid phone number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownMenu(
                    width: double.infinity,
                    hintText: "Select your destination",
                    dropdownMenuEntries: _locToDropDownItem(),
                    controller: _locationController,
                    onSelected: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  Text("Ticket Price: ${priceByLocation[selectedLocation]}"),
                  const SizedBox(height: 20),
                  TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Select date"),
                          prefixIcon: Icon(FontAwesomeIcons.calendarDay)),
                      controller: _dateController,
                      onTap: () => _selectDate(context)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Booking"),
                                  content: const Text("Booking Successful"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                          _nameController.text = "";
                          _phoneController.text = "";
                          selectedLocation = "";
                          _locationController.text = "";
                          _dateController.text = "";
                        }
                      });
                    },
                    child: const Text("Book Ticket"),
                  )
                ],
              ),
            )));
  }

  List<DropdownMenuEntry> _locToDropDownItem() {
    List<String> locations =
    priceByLocation.keys.toList().sublist(0, priceByLocation.length - 1);
    return List.generate(locations.length, (index) {
      return DropdownMenuEntry(
          label: locations[index], value: locations[index]);
    });
  }
}
