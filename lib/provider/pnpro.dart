import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PnPro with ChangeNotifier {
  int _ifa = 0;
  int _weight = 0;

  int get ifa => _ifa;
  int get weight => _weight;

  void incIfa(){
    _ifa++;
  }

  void setIfa(String n){
    _ifa = int.parse(n);
    notifyListeners();
  }

  void decIfa(){
    _ifa--;
    if(_ifa < 0){
      _ifa = 0;
    }
  }

  void incWeight(){
    _weight++;
  }

  void setWeight(String n){
    _weight = int.parse(n);
    notifyListeners();
  }

  void decWeight(){
    _weight--;
    if(_weight < 0){
      _weight = 0;
    }
  }

}