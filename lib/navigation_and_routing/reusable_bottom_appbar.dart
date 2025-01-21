import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableBottomAppBar extends StatelessWidget {
  const ReusableBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {Navigator.pushNamed(context, '/second');}, icon: const Icon(FontAwesomeIcons.burger)),
          IconButton(
              onPressed: () {Navigator.pushNamedAndRemoveUntil(context,'/first',(route) => false,);}, icon: const Icon(FontAwesomeIcons.house)),
          IconButton(
              onPressed: () {Navigator.pop(context);}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ],
      ),
    );
  }
}
