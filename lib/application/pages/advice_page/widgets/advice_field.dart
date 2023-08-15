import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  final String adviceText;
  const AdviceField({super.key, required this.adviceText});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple[100]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            adviceText,
            style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
