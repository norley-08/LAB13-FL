import 'package:flutter/material.dart';
import 'package:log_map/screens.dart/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const LoginScreen(),
    );
  }
}