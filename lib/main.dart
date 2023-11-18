import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/page/cart/cart_provider.dart';
import 'package:shopping_app/presentation/page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          dialogTheme: const DialogTheme(
            backgroundColor: Color.fromARGB(255, 251, 251, 251),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.orangeAccent,
            background: Colors.white,
            onBackground: Colors.white,
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
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
