import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
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
        ],
      ),
    ));
  }
}
