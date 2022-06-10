import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class orspro with ChangeNotifier {

  int _weight = 0;
  int _height = 0;

  String _name = "";

  int get weight => _weight;
  int get height => _height;
  String get name => _name;

  void setName(String nam){
    _name = nam;
    notifyListeners();
  }

  void setHeight(String h){
    _height = int.parse(h);
    notifyListeners();
  }

  void setWeight(String w){
    _weight = int.parse(w);
    notifyListeners();
  }

  void incWeight(){
    _weight++;
  }

  void decWeight(){
    _weight--;
    if(_weight < 0){
      _weight = 0;
    }
  }

  void incHeight(){
    _height++;
  }

  void decHeight(){
    _height--;
    if(_height < 0){
      _height = 0;
    }
  }

}

