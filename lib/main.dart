import 'package:adviceapp/application/pages/advice_page/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:adviceapp/injection.dart' as di; // di = Dependency Injection
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
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
