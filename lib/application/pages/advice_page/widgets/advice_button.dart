import 'package:flutter/material.dart';

class AdviceButton extends StatelessWidget {
  const AdviceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 20,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurple[100],
            ),
            child: const Text(
              "Get Advice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ));
  }
}
