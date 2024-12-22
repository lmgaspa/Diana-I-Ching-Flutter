import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hexagram_provider.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hexagramProvider = Provider.of<HexagramProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Play I Ching'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${hexagramProvider.currentHexagram}.webp',
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return Text('Image not found');
              },
            ),
            SizedBox(height: 20),
            Text(
              '${hexagramProvider.currentHexagram}. ${hexagramProvider.title}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              hexagramProvider.description,
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                hexagramProvider.generateHexagram();
              },
              child: Text('Draw Hexagram'),
            ),
          ],
        ),
      ),
    );
  }
}
