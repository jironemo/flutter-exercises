import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bouquet_provider.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
//Automatically when the widget is removed
// from the widget tree (e.g., navigating away from the screen).
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void submitOrder(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Thank You!"),
          content: const Text("Your order has been placed successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).clearCart();
                //Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Information")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                validator: (value) =>
                    value!.isEmpty ? "Enter your phone number" : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) =>
                    value!.isEmpty ? "Enter your address" : null,
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: "Delivery Date"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => submitOrder(context),
                child: const Text("Place Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
