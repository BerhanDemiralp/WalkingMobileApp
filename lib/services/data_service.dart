import 'package:flutter/material.dart';

class DataService extends ChangeNotifier {
  // Singleton pattern to access the same instance everywhere
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  void notifyDataChanged() {
    notifyListeners();
  }
}
