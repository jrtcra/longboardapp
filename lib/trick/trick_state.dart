import 'package:flutter/material.dart';

class TrickState with ChangeNotifier {

  bool _completed = false;
  bool get completed => _completed;

  set completed(bool newValue) {
    _completed = newValue;
    notifyListeners();
  }
  
}
