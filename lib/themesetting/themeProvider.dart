import 'package:flutter/material.dart';

class themeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get themevalue {
    return _isDark;
  }

  set themevalue(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
