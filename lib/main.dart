import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/page/product/product_detail_page.dart';

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
          prefixIconColor: Colors.black38,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      home: const ProductDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
