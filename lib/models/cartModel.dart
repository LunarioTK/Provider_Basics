import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<String> _itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  void add(String newItem) {
    _itemNames.add(newItem);
    notifyListeners();
  }

  void removeAll() {
    _itemNames.clear();
    notifyListeners();
  }
}
