import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/hexagram_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HexagramProvider(),
      child: DianaIChingApp(),
    ),
  );
}

class DianaIChingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diana I Ching',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}
