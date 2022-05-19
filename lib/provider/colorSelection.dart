import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class colorSelect with ChangeNotifier {
  int _cs = 0;

  int get CoS => _cs;

  void set_color(int a) async {
    this._cs = a;
    notifyListeners();
  }
}