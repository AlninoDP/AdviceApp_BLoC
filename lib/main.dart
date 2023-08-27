import 'package:adviceapp/application/pages/advice_page/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:adviceapp/injection.dart' as di; // di = Dependency Injection
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return MaterialApp(
      title: 'Advicer',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const AdvicePageWrapper(),
    );
  }
}
