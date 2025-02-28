import 'package:demo_app/mid_serm/car_rental/booking.dart';
import 'package:demo_app/mid_serm/car_rental/detail.dart';
import 'package:demo_app/mid_serm/car_rental/start_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/start",
      routes: {
        "/start": (context) => const StartPage(),
        "/booking": (context) => const BookingPage(),
        "/detail": (context) => const DetailsPage()
      },
    );
  }
}
