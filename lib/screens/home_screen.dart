import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hexagram_provider.dart';
import 'play_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diana I Ching'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<HexagramProvider>(context, listen: false)
                .generateHexagram();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayScreen()),
            );
          },
          child: Text('Play I Ching'),
        ),
      ),
    );
  }
}
