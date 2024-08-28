import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  const MyButtons({super.key, required this.text, required this.onpressed});
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onpressed,
        color: const Color.fromARGB(255, 130, 146, 192),
        child: Text(text));
  }
}
