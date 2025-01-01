import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sneakers Payment App',
      theme: ThemeData(
        primarySwatch: Colors.red, // Use a MaterialColor like Colors.red
      ),
      home: const LoginPage(), // Ensure the statement ends with a semicolon
    );
  }
}
