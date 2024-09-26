import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  const BoardButton({super.key, required this.text, required this.onPressed, required this.index});

  final String text;
  final Function onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: () {
        onPressed(index);
      },
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 30, color: Colors.white),
      ),
    );
  }
}
