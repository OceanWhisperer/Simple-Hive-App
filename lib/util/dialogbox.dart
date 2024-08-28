import 'package:flutter/material.dart';
import 'package:simpletodoapp/util/my_buttons.dart';

class DialogboxMade extends StatelessWidget {
  const DialogboxMade(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});
  final controller;
  final VoidCallback onsave;
  final VoidCallback oncancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 191, 199, 227),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      content: SizedBox(
        height: 160,
        width: 150,
        child: Column(
          children: [
            const Text(
              "Add Your Note",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind ?',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "save", onpressed: onsave),
                const SizedBox(
                  width: 5,
                ),
                MyButtons(text: "cancel", onpressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
