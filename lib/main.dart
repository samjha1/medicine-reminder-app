import 'package:flutter/material.dart';
import 'package:sam/presentation/screens/login.dart';

void main() {
  runApp(const AdhicineApp());
}

class AdhicineApp extends StatelessWidget {
  const AdhicineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adhicine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SF Pro Display',
      ),
      home: const LoginScreen(),
    );
  }
}
