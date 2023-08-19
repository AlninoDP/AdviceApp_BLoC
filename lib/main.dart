import 'package:adviceapp/application/pages/advice_page/advice_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Advicer',
      debugShowCheckedModeBanner: false,
      home: AdvicePageWrapper(),
    );
  }
}
