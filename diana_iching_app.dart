import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DianaIChingApp());
}

class DianaIChingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HexagramProvider(),
      child: MaterialApp(
        title: 'Diana I Ching',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HexagramProvider extends ChangeNotifier {
  int? _currentHexagram;

  int? get currentHexagram => _currentHexagram;

  void generateHexagram() {
    _currentHexagram = Random().nextInt(64) + 1;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diana I Ching'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Cat I Ching',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayScreen()),
                );
              },
              child: Text('Play I Ching'),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play I Ching'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<HexagramProvider>().generateHexagram();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(),
              ),
            );
          },
          child: Text('Play I Ching'),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hexagramNumber = context.watch<HexagramProvider>().currentHexagram;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do I Ching'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hexagramNumber != null)
              Column(
                children: [
                  Text(
                    'Hexagrama Sorteado: $hexagramNumber',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/hexagram_$hexagramNumber.wbep',
                    height: 200,
                    width: 200,
                  ),
                ],
              )
            else
              Text(
                'Erro ao gerar hexagrama.',
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
