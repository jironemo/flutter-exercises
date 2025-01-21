import 'package:flutter/material.dart';

void main() {
  RegExp emailExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');
  print("Result:"+ emailExp.hasMatch("aungkhaingkhant.dev@gmail.com").toString());
}