// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharing_square/Screens/Home/HomeScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: const Color.fromARGB(255, 29, 47, 111),
    100: const Color.fromARGB(255, 29, 47, 111),
    200: const Color.fromARGB(255, 29, 47, 111),
    300: const Color.fromARGB(255, 29, 47, 111),
    400: const Color.fromARGB(255, 29, 47, 111),
    500: const Color.fromARGB(255, 29, 47, 111),
    600: const Color.fromARGB(255, 29, 47, 111),
    700: const Color.fromARGB(255, 29, 47, 111),
    800: const Color.fromARGB(255, 29, 47, 111),
    900: const Color.fromARGB(255, 29, 47, 111),
  };

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    MaterialColor colorCustom = MaterialColor(0xFF1D2F6F, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
