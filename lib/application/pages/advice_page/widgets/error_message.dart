import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_outlined,
          size: 46,
          color: Colors.redAccent,
        ),
        Text(
          message,
          style: const TextStyle(fontSize: 19),
        )
      ],
    );
  }
}
