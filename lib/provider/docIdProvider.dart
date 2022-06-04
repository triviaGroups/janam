import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DocID with ChangeNotifier {
  String _doc = "";
  String _address = "";
  int _G = 0;
  String _name = "";
  String _dob = "";

  String get doc => _doc;
  String get address => _address;
  int get G => _G;
  String get name => _name;
  String get dob => _dob;

  void setEc(String val,String add,int g,String name,String dob){
    _doc = val;
    _address = add;
    _G = g;
    _name = name;
    _dob = dob;
    print("Setted");
    notifyListeners();
  }
}