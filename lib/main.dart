import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.redAccent,
            primary: Colors.orangeAccent,
          ),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontSize: 18),
              prefixIconColor: Colors.black38)),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
