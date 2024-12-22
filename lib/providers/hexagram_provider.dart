import 'package:flutter/material.dart';
import 'dart:math';
import '../data/hexagrams.dart';

class HexagramProvider extends ChangeNotifier {
  int currentHexagram = Random().nextInt(64) + 1;

  void generateHexagram() {
    currentHexagram = Random().nextInt(64) + 1;
    notifyListeners();
  }

  String get title => Hexagrams.titles[currentHexagram] ?? "Title not found";

  String get description =>
      Hexagrams.descriptions[currentHexagram] ?? "Description not found";
}
