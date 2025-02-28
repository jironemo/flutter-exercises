import 'package:demo_app/lab_2/ticket.dart';
import 'package:flutter/material.dart';

class BookingInfoPage extends StatelessWidget {
  const BookingInfoPage({super.key});

  Widget backHomeBtn(BuildContext context, bool success) {
    return ElevatedButton(
      onPressed: success
          ? () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Booking"),
                      content: const Text("Booking Successful"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (route) => false); // Close the dialog
                          },
                          child: const Text('OK'),
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    );
                  });
            }
          : () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (route) => false); // Close the dialog
            },
      child: Text(success ? "Confirm Booking" : "Go Back to Home Page"),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      return Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("No Data Available"),
          const SizedBox(height: 40),
          backHomeBtn(context, false)
        ],
      )));
    } else {
      Ticket details = ModalRoute.of(context)?.settings.arguments as Ticket;
      return Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Booking Ticket",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
          const SizedBox(height: 40),
          Text("Name: ${details.cname}",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text("Phone: ${details.phno}"),
          const SizedBox(height: 20),
          Text("Location: ${details.city}"),
          const SizedBox(height: 20),
          Text("Date: ${details.date}"),
          const SizedBox(height: 20),
          Text("Price: ${details.price}"),
          const SizedBox(height: 40),
          backHomeBtn(context, true)
        ],
      )));
    }
  }
}
