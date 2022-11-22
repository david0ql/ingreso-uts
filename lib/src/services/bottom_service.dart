import 'package:flutter/cupertino.dart';

class BottomService with ChangeNotifier {
  bool _isLoading = true;
  int _selectedIndex = 0;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
